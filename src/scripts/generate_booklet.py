#!/usr/bin/env python3
"""
generate_booklet.py - Generates a consolidated Christmas carols booklet PDF.
Includes:
1. Cover page with festive graphics and typography (Swiss German spelling conventions).
2. All carol sheet music scores with dynamic page numbering overlay.
3. Table of Contents (Inhaltsverzeichnis) placed at the end of the booklet.
"""

import os
import sys
import math
import io
import json
import re
from fpdf import FPDF
import pypdf

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, "../.."))
BUILD_DIR = os.path.join(REPO_ROOT, "build")
PDF_DIR = os.path.join(BUILD_DIR, "pdf")
SONGS_DIR = os.path.join(REPO_ROOT, "src", "songs")
CATALOG_PATH = os.path.join(BUILD_DIR, "catalog.json")

def sanitize_text(text):
    if not text:
        return ""
    replacements = {
        '’': "'",
        '‘': "'",
        '“': '"',
        '”': '"',
        '„': '"',
        '–': '-',
        '—': '-',
        '…': '...',
        'ß': 'ss',
    }
    for k, v in replacements.items():
        text = text.replace(k, v)
    return text.encode('latin-1', 'replace').decode('latin-1')

def draw_star(pdf, cx, cy, r_outer, r_inner, points=5, fill_color=(255, 215, 0)):
    pdf.set_fill_color(*fill_color)
    angle_step = math.pi / points
    coords = []
    start_angle = -math.pi / 2
    for i in range(2 * points):
        r = r_outer if i % 2 == 0 else r_inner
        ang = start_angle + i * angle_step
        x = cx + r * math.cos(ang)
        y = cy + r * math.sin(ang)
        coords.append((x, y))

    # Draw star as polygon
    pdf.polygon(coords, style='F')

def draw_christmas_tree(pdf, cx, cy, width, height):
    # Tree trunk
    trunk_w = width * 0.18
    trunk_h = height * 0.15
    pdf.set_fill_color(101, 67, 33) # Warm Brown
    pdf.rect(cx - trunk_w / 2, cy + height - trunk_h, trunk_w, trunk_h, style='F')

    # Tree tiers (dark pine green to emerald)
    tiers = [
        (0.0, 0.40, width * 0.55),
        (0.25, 0.65, width * 0.78),
        (0.50, 0.90, width * 1.0)
    ]

    for start_f, end_f, w in tiers:
        top_y = cy + start_f * (height - trunk_h)
        bot_y = cy + end_f * (height - trunk_h)
        pts = [
            (cx, top_y),
            (cx + w / 2, bot_y),
            (cx - w / 2, bot_y)
        ]
        pdf.set_fill_color(24, 94, 52) # Pine green
        pdf.polygon(pts, style='F')

    # Tree ornaments (colorful baubles)
    baubles = [
        (cx - width * 0.2, cy + height * 0.35, (220, 20, 60)),
        (cx + width * 0.18, cy + height * 0.40, (255, 215, 0)),
        (cx - width * 0.28, cy + height * 0.58, (255, 215, 0)),
        (cx + width * 0.25, cy + height * 0.62, (220, 20, 60)),
        (cx, cy + height * 0.50, (30, 144, 255)),
        (cx - width * 0.35, cy + height * 0.78, (255, 255, 255)),
        (cx + width * 0.35, cy + height * 0.80, (255, 215, 0)),
        (cx - width * 0.12, cy + height * 0.75, (220, 20, 60)),
        (cx + width * 0.10, cy + height * 0.73, (30, 144, 255)),
    ]
    for bx, by, col in baubles:
        pdf.set_fill_color(*col)
        pdf.ellipse(bx - 2.2, by - 2.2, 4.4, 4.4, style='F')

    # Golden Star on top of tree
    draw_star(pdf, cx, cy - 2, 7, 3, points=5, fill_color=(255, 223, 0))

def create_cover_page():
    pdf = FPDF()
    pdf.add_page()
    pdf.set_auto_page_break(auto=False)

    # Midnight Blue Background
    pdf.set_fill_color(16, 28, 54) # Deep festive night navy
    pdf.rect(0, 0, 210, 297, style='F')

    # Gold Ornamental Double Border
    pdf.set_draw_color(212, 175, 55) # Classic Gold
    pdf.set_line_width(1.2)
    pdf.rect(10, 10, 190, 277)
    pdf.set_line_width(0.4)
    pdf.rect(13, 13, 184, 271)

    # Corner decorative stars
    corners = [(13, 13), (197, 13), (13, 284), (197, 284)]
    for cx, cy in corners:
        draw_star(pdf, cx, cy, 4, 1.8, points=4, fill_color=(255, 223, 0))

    # Floating background twinkling stars
    stars = [
        (30, 35, 2.5), (180, 40, 3.0), (45, 60, 2.0), (165, 75, 2.8),
        (25, 110, 3.0), (185, 120, 2.2), (35, 160, 2.5), (175, 170, 3.2),
        (28, 220, 2.0), (182, 230, 2.8), (40, 260, 2.5), (170, 265, 2.0),
        (60, 45, 1.8), (150, 50, 2.0), (105, 30, 2.5)
    ]
    for sx, sy, sr in stars:
        draw_star(pdf, sx, sy, sr, sr * 0.45, points=4, fill_color=(255, 235, 150))

    # Main Title Header Banner
    pdf.set_y(40)
    pdf.set_font('Helvetica', 'B', 30)
    pdf.set_text_color(255, 220, 75) # Warm Gold
    pdf.cell(0, 14, sanitize_text("Deutsche Weihnachtslieder"), align='C', new_x='LMARGIN', new_y='NEXT')

    # Subtitle
    pdf.set_y(58)
    pdf.set_font('Helvetica', 'I', 15)
    pdf.set_text_color(230, 235, 245) # Soft white/silver
    pdf.cell(0, 8, sanitize_text("Das grosse Chorbuch & Noten-Liederbuch"), align='C', new_x='LMARGIN', new_y='NEXT')

    pdf.set_y(68)
    pdf.set_font('Helvetica', '', 11)
    pdf.set_text_color(200, 210, 225)
    pdf.cell(0, 6, sanitize_text("Vierstimmige Chorsaetze (SATB) mit Akkorden und Texten"), align='C', new_x='LMARGIN', new_y='NEXT')

    # Central Festive Illustration (Christmas Tree with Ornaments & Star)
    draw_christmas_tree(pdf, 105, 95, 65, 88)

    # Decorative Ribbon / Sub-banner
    ribbon_y = 202
    pdf.set_fill_color(139, 0, 0) # Festive Deep Red
    pdf.rect(35, ribbon_y, 140, 18, style='F')
    pdf.set_draw_color(212, 175, 55)
    pdf.set_line_width(0.6)
    pdf.rect(35, ribbon_y, 140, 18)

    pdf.set_y(ribbon_y + 3)
    pdf.set_font('Helvetica', 'B', 13)
    pdf.set_text_color(255, 245, 220)
    pdf.cell(0, 12, sanitize_text("Sammlung der schönsten Weihnachtslieder"), align='C', new_x='LMARGIN', new_y='NEXT')

    # Features List / Badges
    pdf.set_y(232)
    pdf.set_font('Helvetica', 'I', 10)
    pdf.set_text_color(215, 225, 240)
    pdf.cell(0, 5, sanitize_text("Klassische traditionelle Weisen & internationale Festlieder"), align='C', new_x='LMARGIN', new_y='NEXT')
    pdf.set_y(239)
    pdf.cell(0, 5, sanitize_text("Notenblatt, Liedtexte und Gitarrenakkorde"), align='C', new_x='LMARGIN', new_y='NEXT')

    # Bottom Edition / Copyright
    pdf.set_y(262)
    pdf.set_font('Helvetica', 'B', 10)
    pdf.set_text_color(212, 175, 55) # Gold
    pdf.cell(0, 5, sanitize_text("Open Source Musiksammlung"), align='C', new_x='LMARGIN', new_y='NEXT')
    pdf.set_y(268)
    pdf.set_font('Helvetica', '', 9)
    pdf.set_text_color(180, 190, 205)
    pdf.cell(0, 5, sanitize_text("LilyPond Edition | Vollstaendiges Liederbuch"), align='C', new_x='LMARGIN', new_y='NEXT')

    buf = io.BytesIO()
    pdf.output(buf)
    buf.seek(0)
    return pypdf.PdfReader(buf).pages[0]

def create_page_number_overlay(page_number, total_pages=None):
    pdf = FPDF()
    pdf.add_page()
    pdf.set_auto_page_break(auto=False)
    pdf.set_y(285)
    pdf.set_font('Helvetica', '', 9)
    pdf.set_text_color(100, 100, 100)
    text = f"- {page_number} -"
    pdf.cell(0, 8, text, align='C')

    buf = io.BytesIO()
    pdf.output(buf)
    buf.seek(0)
    return pypdf.PdfReader(buf).pages[0]

class TOCPDF(FPDF):
    def __init__(self, start_page_num):
        super().__init__()
        self.current_toc_page = start_page_num

    def footer(self):
        self.set_y(-15)
        self.set_font('Helvetica', '', 9)
        self.set_text_color(100, 100, 100)
        self.cell(0, 8, f"- {self.current_toc_page + self.page_no() - 1} -", align='C')

def create_toc_pages(song_entries, start_page_num):
    """
    song_entries: list of tuples (number, title, composer, page_num)
    start_page_num: page number on which the TOC begins
    Returns list of pypdf PageObjects
    """
    pdf = TOCPDF(start_page_num)
    pdf.set_auto_page_break(auto=False)
    pdf.add_page()

    # Decorative header
    pdf.set_draw_color(212, 175, 55) # Gold
    pdf.set_line_width(0.8)
    pdf.line(20, 20, 190, 20)

    pdf.set_y(24)
    pdf.set_font('Helvetica', 'B', 22)
    pdf.set_text_color(20, 35, 65) # Navy
    pdf.cell(0, 12, sanitize_text("Inhaltsverzeichnis"), align='C', new_x='LMARGIN', new_y='NEXT')

    pdf.set_font('Helvetica', 'I', 11)
    pdf.set_text_color(110, 110, 110)
    pdf.cell(0, 7, sanitize_text("Uebersicht aller Lieder"), align='C', new_x='LMARGIN', new_y='NEXT')
    pdf.ln(4)

    pdf.set_line_width(0.4)
    pdf.line(20, 48, 190, 48)
    pdf.set_y(54)

    # Print song entries
    for idx, title, composer, page_num in song_entries:
        if pdf.get_y() > 260:
            pdf.add_page()
            # Header on subsequent page
            pdf.set_draw_color(212, 175, 55)
            pdf.set_line_width(0.8)
            pdf.line(20, 20, 190, 20)

            pdf.set_y(24)
            pdf.set_font('Helvetica', 'B', 18)
            pdf.set_text_color(20, 35, 65)
            pdf.cell(0, 10, sanitize_text("Inhaltsverzeichnis (Fortsetzung)"), align='C', new_x='LMARGIN', new_y='NEXT')
            pdf.ln(4)
            pdf.set_line_width(0.4)
            pdf.line(20, 40, 190, 40)
            pdf.set_y(46)

        # Row printing
        y_pos = pdf.get_y()
        pdf.set_font('Helvetica', 'B', 10)
        pdf.set_text_color(25, 25, 25)

        clean_title = sanitize_text(f"{idx}. {title}")
        clean_page = f"Seite {page_num}"

        # Title width
        title_w = pdf.get_string_width(clean_title)
        page_w = pdf.get_string_width(clean_page)

        pdf.set_x(20)
        pdf.cell(title_w + 2, 5.5, clean_title)

        # Dot leaders
        start_dots = 20 + title_w + 3
        end_dots = 190 - page_w - 4
        if end_dots > start_dots:
            pdf.set_font('Helvetica', '', 9)
            pdf.set_text_color(160, 160, 160)
            single_dot_w = pdf.get_string_width(". ")
            count = int((end_dots - start_dots) / single_dot_w)
            dot_str = ". " * count
            pdf.set_x(start_dots)
            pdf.cell(end_dots - start_dots, 5.5, dot_str)

        # Page number
        pdf.set_font('Helvetica', 'B', 10)
        pdf.set_text_color(20, 35, 65)
        pdf.set_x(190 - page_w)
        pdf.cell(page_w, 5.5, clean_page, new_x='LMARGIN', new_y='NEXT')

        # Subtitle / composer if available
        if composer:
            clean_comp = sanitize_text(composer)
            pdf.set_x(26)
            pdf.set_font('Helvetica', 'I', 8)
            pdf.set_text_color(120, 120, 120)
            pdf.cell(0, 4, clean_comp, new_x='LMARGIN', new_y='NEXT')
            pdf.ln(1)
        else:
            pdf.ln(1.5)

    buf = io.BytesIO()
    pdf.output(buf)
    buf.seek(0)
    reader = pypdf.PdfReader(buf)
    return list(reader.pages)

def load_songs_catalog():
    if os.path.exists(CATALOG_PATH):
        try:
            with open(CATALOG_PATH, 'r', encoding='utf-8') as f:
                data = json.load(f)
                return data.get("songs", [])
        except Exception as e:
            print(f"Warning loading catalog.json: {e}")

    # Fallback scanning songs directory
    songs = []
    if os.path.exists(SONGS_DIR):
        song_dirs = sorted([d for d in os.listdir(SONGS_DIR) if os.path.isdir(os.path.join(SONGS_DIR, d))])
        for idx, sid in enumerate(song_dirs, 1):
            songs.append({
                "id": sid,
                "number": idx,
                "title": sid.replace('_', ' ').title(),
                "composer": "Volkslied"
            })
    return songs

def generate_booklet(output_pdf_path=None):
    if output_pdf_path is None:
        output_pdf_path = os.path.join(PDF_DIR, "weihnachtslieder_liederbuch.pdf")

    os.makedirs(os.path.dirname(output_pdf_path), exist_ok=True)
    print(f"==> Generating complete Christmas Carol Booklet: '{output_pdf_path}'...")

    songs_data = load_songs_catalog()
    if not songs_data:
        print("Error: No song records found to compile booklet.")
        return False

    writer = pypdf.PdfWriter()

    # 1. Add Cover Page (Page 1)
    print("    [1/3] Rendering cover page with festive vector graphics...")
    cover_page = create_cover_page()
    writer.add_page(cover_page)

    current_page = 2
    song_toc_entries = []

    # 2. Add Songs with Page Numbers
    print("    [2/3] Merging song sheet music pages and stamping page numbers...")
    for song in songs_data:
        song_id = song.get("id")
        title = song.get("title", song_id)
        composer = song.get("composer", "")
        number = song.get("number", len(song_toc_entries) + 1)

        song_pdf_file = os.path.join(PDF_DIR, f"{song_id}.pdf")
        if not os.path.exists(song_pdf_file):
            print(f"    Warning: Missing PDF for song '{song_id}', skipping in booklet.")
            continue

        reader = pypdf.PdfReader(song_pdf_file)
        start_song_page = current_page
        song_toc_entries.append((number, title, composer, start_song_page))

        for page in reader.pages:
            overlay_page = create_page_number_overlay(current_page)
            page.merge_page(overlay_page)
            writer.add_page(page)
            current_page += 1

    # 3. Add Table of Contents (TOC) at the end
    print(f"    [3/3] Generating Table of Contents (Inhaltsverzeichnis) at page {current_page}...")
    toc_pages = create_toc_pages(song_toc_entries, start_page_num=current_page)
    for toc_page in toc_pages:
        writer.add_page(toc_page)
        current_page += 1

    # Write final booklet
    with open(output_pdf_path, 'wb') as f:
        writer.write(f)

    # Also create symlink or copy to booklet.pdf
    booklet_alias = os.path.join(PDF_DIR, "booklet.pdf")
    try:
        if os.path.exists(booklet_alias):
            os.remove(booklet_alias)
        with open(booklet_alias, 'wb') as f:
            with open(output_pdf_path, 'rb') as src_f:
                f.write(src_f.read())
    except Exception as e:
        print(f"Notice: Could not write booklet alias: {e}")

    total_pages = len(writer.pages)
    print(f"==> Successfully generated booklet: {output_pdf_path} ({total_pages} pages).")
    return True

if __name__ == "__main__":
    out = sys.argv[1] if len(sys.argv) > 1 else None
    generate_booklet(out)
