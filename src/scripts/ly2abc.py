#!/usr/bin/env python3
"""
ly2abc.py - LilyPond to ABC notation derivation script.
Converts LilyPond (.ly) master files into ABC (.abc) notation for browser rendering.
"""

import sys
import os
import re

def parse_lilypond_header(content):
    headers = {}
    header_match = re.search(r'\\header\s*\{([^}]+)\}', content, re.DOTALL)
    if header_match:
        header_block = header_match.group(1)
        for line in header_block.splitlines():
            line = line.strip()
            if '=' in line:
                k, v = line.split('=', 1)
                k = k.strip().lower()
                v = v.strip().strip('"').strip("'")
                headers[k] = v
    return headers

def parse_time_signature(content):
    m = re.search(r'\\time\s+([0-9]+/[0-9]+)', content)
    if m:
        return m.group(1)
    return "4/4"

def parse_key_signature(content):
    # e.g., \key c \major or \key f \major or \key g \major or \key bes \major
    m = re.search(r'\\key\s+([a-gA-G](?:es|is|s)?)\s+\\([a-zA-Z]+)', content)
    if m:
        note = m.group(1).lower()
        mode = m.group(2).lower()

        note_map = {
            'c': 'C', 'cis': 'C#', 'des': 'Db',
            'd': 'D', 'dis': 'D#', 'es': 'Eb', 'ees': 'Eb',
            'e': 'E',
            'f': 'F', 'fis': 'F#', 'ges': 'Gb',
            'g': 'G', 'gis': 'G#', 'as': 'Ab', 'aes': 'Ab',
            'a': 'A', 'ais': 'A#', 'bes': 'Bb', 'b': 'B', 'bis': 'B#'
        }
        abc_note = note_map.get(note, 'C')
        if mode in ['major', 'dur']:
            return abc_note
        elif mode in ['minor', 'moll']:
            return abc_note + "m"
        return abc_note
    return "C"

def parse_tempo(content):
    m = re.search(r'\\tempo\s+4(?:\.)?\s*=\s*([0-9]+)', content)
    if m:
        return f"1/4={m.group(1)}"
    return "1/4=100"

def extract_lyrics(content):
    lyrics_list = []
    matches = re.findall(r'\\(?:addlyrics|lyricmode)\s*\{([^}]+)\}', content, re.DOTALL)
    for block in matches:
        lines = []
        for line in block.splitlines():
            line = re.sub(r'%.*', '', line).strip()
            if not line:
                continue
            line = line.replace('--', '-')
            line = line.replace('__', '')
            words = line.split()
            cleaned_words = [w for w in words if not w.startswith('\\')]
            if cleaned_words:
                lines.append(" ".join(cleaned_words))
        if lines:
            lyrics_list.append("\n".join(lines))
    return lyrics_list

def convert_melody_to_abc(content):
    """
    Parses notes from LilyPond melody block into basic ABC notation bars.
    """
    melody_match = re.search(r'melody\s*=\s*\\relative\s+c[\'\,]*\s*\{([^}]+)\}', content, re.DOTALL)
    if not melody_match:
        melody_match = re.search(r'\\relative\s+c[\'\,]*\s*\{([^}]+)\}', content, re.DOTALL)
    if not melody_match:
        melody_match = re.search(r'melody\s*=\s*\{([^}]+)\}', content, re.DOTALL)

    notes_text = melody_match.group(1) if melody_match else content

    # Clean comments
    notes_text = re.sub(r'%.*', '', notes_text)

    tokens = notes_text.split()
    abc_bars = []
    current_bar = []

    note_pitch_map = {
        'c': 'C', 'd': 'D', 'e': 'E', 'f': 'F', 'g': 'G', 'a': 'A', 'b': 'B',
        'cis': '^C', 'dis': '^D', 'fis': '^F', 'gis': '^G', 'ais': '^A',
        'des': '_D', 'es': '_E', 'ees': '_E', 'ges': '_G', 'as': '_A', 'bes': '_B'
    }

    for tok in tokens:
        tok = tok.strip()
        if not tok or tok.startswith('\\') or tok in ['}', '\\bar', '"|."']:
            continue

        if tok == '|':
            if current_bar:
                abc_bars.append(" ".join(current_bar))
                current_bar = []
            continue

        # Strip slurs '(', ')', ties '~', articulations '.', '!'
        clean_tok = re.sub(r'[\(\)\~\.\!]', '', tok)

        # Check for rest
        m_rest = re.match(r'^r([0-9]*\.?)$', clean_tok)
        if m_rest:
            dur = m_rest.group(1)
            current_bar.append(f"z{dur if dur else ''}")
            continue

        # Match note pitch and duration
        m_note = re.match(r'^([a-gA-G](?:es|is|s)?)([\'\,]*)([0-9]*\.?)$', clean_tok)
        if m_note:
            pitch = m_note.group(1).lower()
            octave_marks = m_note.group(2)
            dur = m_note.group(3)

            abc_pitch = note_pitch_map.get(pitch, 'C')

            if '\'' in octave_marks:
                abc_pitch = abc_pitch.lower()
            elif ',' in octave_marks:
                abc_pitch = abc_pitch.upper()
            else:
                abc_pitch = abc_pitch.lower()

            current_bar.append(f"{abc_pitch}{dur if dur else ''}")

    if current_bar:
        abc_bars.append(" ".join(current_bar))

    if not abc_bars:
        return "C2 D2 E2 F2 | G4 G4 |"

    return " | ".join(abc_bars) + " |"

def ly2abc(ly_content):
    headers = parse_lilypond_header(ly_content)
    title = headers.get('title', 'Unbekanntes Lied')
    composer = headers.get('composer', 'Volkslied')
    meter = parse_time_signature(ly_content)
    key = parse_key_signature(ly_content)
    tempo = parse_tempo(ly_content)

    abc_lines = [
        "X:1",
        f"T:{title}",
        f"C:{composer}",
        f"M:{meter}",
        "L:1/8",
        f"Q:{tempo}",
        f"K:{key}",
        "V:1 clef=treble",
    ]

    melody = convert_melody_to_abc(ly_content)
    abc_lines.append(melody)

    lyrics = extract_lyrics(ly_content)
    for lyric_block in lyrics:
        for line in lyric_block.splitlines():
            abc_lines.append(f"w: {line}")

    return "\n".join(abc_lines) + "\n"

def main():
    if len(sys.argv) < 3:
        print("Usage: python3 ly2abc.py <input.ly> <output.abc>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    if not os.path.exists(input_file):
        print(f"Error: Input file '{input_file}' does not exist.")
        sys.exit(1)

    with open(input_file, 'r', encoding='utf-8') as f:
        ly_content = f.read()

    abc_content = ly2abc(ly_content)

    os.makedirs(os.path.dirname(os.path.abspath(output_file)), exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(abc_content)

    print(f"Successfully converted '{input_file}' to '{output_file}'.")

if __name__ == "__main__":
    main()
