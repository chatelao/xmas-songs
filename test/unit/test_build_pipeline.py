import unittest
import os
import json
import subprocess

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, "../.."))
SONGS_DIR = os.path.join(REPO_ROOT, "src", "songs")

EXPECTED_SONGS = sorted([
    d for d in os.listdir(SONGS_DIR)
    if os.path.isdir(os.path.join(SONGS_DIR, d))
])

class TestBuildPipeline(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        # Run build pipeline
        build_script = os.path.join(REPO_ROOT, "src", "scripts", "build_pipeline.sh")
        res = subprocess.run([build_script], capture_output=True, text=True)
        assert res.returncode == 0, f"Build pipeline failed with output:\n{res.stderr}"

    def test_pdf_generation_for_all_songs(self):
        for song_id in EXPECTED_SONGS:
            pdf_path = os.path.join(REPO_ROOT, "build", "pdf", f"{song_id}.pdf")
            self.assertTrue(os.path.exists(pdf_path), f"PDF asset for {song_id} does not exist")
            self.assertGreater(os.path.getsize(pdf_path), 0, f"PDF asset for {song_id} is empty")

    def test_abc_generation_for_all_songs(self):
        for song_id in EXPECTED_SONGS:
            abc_path = os.path.join(REPO_ROOT, "build", "abc", f"{song_id}.abc")
            self.assertTrue(os.path.exists(abc_path), f"ABC asset for {song_id} does not exist")
            self.assertGreater(os.path.getsize(abc_path), 0, f"ABC asset for {song_id} is empty")

            with open(abc_path, 'r', encoding='utf-8') as f:
                content = f.read()
                self.assertIn("X:1", content)
                self.assertIn("T:", content)

    def test_mp3_generation_for_all_songs(self):
        for song_id in EXPECTED_SONGS:
            mp3_path = os.path.join(REPO_ROOT, "build", "mp3", f"{song_id}.mp3")
            self.assertTrue(os.path.exists(mp3_path), f"MP3 asset for {song_id} does not exist")
            self.assertGreater(os.path.getsize(mp3_path), 0, f"MP3 asset for {song_id} is empty")

    def test_catalog_json_generation(self):
        catalog_path = os.path.join(REPO_ROOT, "build", "catalog.json")
        self.assertTrue(os.path.exists(catalog_path), "catalog.json does not exist")

        with open(catalog_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
            self.assertIn("songs", data)
            self.assertEqual(data["count"], len(EXPECTED_SONGS))

            catalog_song_ids = [song["id"] for song in data["songs"]]
            for song_id in EXPECTED_SONGS:
                self.assertIn(song_id, catalog_song_ids)

            for song in data["songs"]:
                self.assertIsNotNone(song["assets"]["pdf"])
                self.assertIsNotNone(song["assets"]["abc"])
                self.assertIsNotNone(song["assets"]["mp3"])

if __name__ == "__main__":
    unittest.main()
