import unittest
import os
import subprocess
import tempfile

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, "../.."))
SONGS_DIR = os.path.join(REPO_ROOT, "src", "songs")
BUILD_DIR = os.path.join(REPO_ROOT, "build")

EXPECTED_SONGS = sorted([
    d for d in os.listdir(SONGS_DIR)
    if os.path.isdir(os.path.join(SONGS_DIR, d))
])

class TestNotationValidation(unittest.TestCase):

    def test_lilypond_syntax_validation(self):
        """Validate LilyPond syntax for all .ly master score files using lilypond compiler dry-run parsing."""
        with tempfile.TemporaryDirectory() as tmp_dir:
            for song_id in EXPECTED_SONGS:
                ly_path = os.path.join(SONGS_DIR, song_id, f"{song_id}.ly")
                self.assertTrue(os.path.exists(ly_path), f"LilyPond master file missing for {song_id}")

                out_prefix = os.path.join(tmp_dir, song_id)
                res = subprocess.run(
                    ["lilypond", "-dprint-pages=#f", "-o", out_prefix, ly_path],
                    capture_output=True,
                    text=True
                )
                self.assertEqual(
                    res.returncode, 0,
                    f"LilyPond syntax validation failed for {song_id}:\n{res.stderr}"
                )

    def test_asset_integrity_and_non_zero_size(self):
        """Verify existence and non-zero size for generated PDF, ABC, and MP3 files."""
        pdf_dir = os.path.join(BUILD_DIR, "pdf")
        abc_dir = os.path.join(BUILD_DIR, "abc")
        mp3_dir = os.path.join(BUILD_DIR, "mp3")

        for song_id in EXPECTED_SONGS:
            pdf_path = os.path.join(pdf_dir, f"{song_id}.pdf")
            abc_path = os.path.join(abc_dir, f"{song_id}.abc")
            mp3_path = os.path.join(mp3_dir, f"{song_id}.mp3")

            self.assertTrue(os.path.exists(pdf_path), f"PDF asset missing for {song_id}")
            self.assertGreater(os.path.getsize(pdf_path), 0, f"PDF asset is empty for {song_id}")

            self.assertTrue(os.path.exists(abc_path), f"ABC asset missing for {song_id}")
            self.assertGreater(os.path.getsize(abc_path), 0, f"ABC asset is empty for {song_id}")

            self.assertTrue(os.path.exists(mp3_path), f"MP3 asset missing for {song_id}")
            self.assertGreater(os.path.getsize(mp3_path), 0, f"MP3 asset is empty for {song_id}")

if __name__ == "__main__":
    unittest.main()
