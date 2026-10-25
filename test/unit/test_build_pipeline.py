import unittest
import os
import json
import subprocess

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, "../.."))

class TestBuildPipeline(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        # Run build pipeline
        build_script = os.path.join(REPO_ROOT, "src", "scripts", "build_pipeline.sh")
        res = subprocess.run([build_script], capture_output=True, text=True)
        assert res.returncode == 0, f"Build pipeline failed with output:\n{res.stderr}"

    def test_pdf_generation(self):
        pdf_path = os.path.join(REPO_ROOT, "build", "pdf", "stille_nacht.pdf")
        self.assertTrue(os.path.exists(pdf_path), "PDF asset does not exist")
        self.assertGreater(os.path.getsize(pdf_path), 0, "PDF asset is empty")

    def test_abc_generation(self):
        abc_path = os.path.join(REPO_ROOT, "build", "abc", "stille_nacht.abc")
        self.assertTrue(os.path.exists(abc_path), "ABC asset does not exist")
        self.assertGreater(os.path.getsize(abc_path), 0, "ABC asset is empty")

        with open(abc_path, 'r', encoding='utf-8') as f:
            content = f.read()
            self.assertIn("T:Stille Nacht, heilige Nacht", content)
            self.assertIn("X:1", content)

    def test_mp3_generation(self):
        mp3_path = os.path.join(REPO_ROOT, "build", "mp3", "stille_nacht.mp3")
        self.assertTrue(os.path.exists(mp3_path), "MP3 asset does not exist")
        self.assertGreater(os.path.getsize(mp3_path), 0, "MP3 asset is empty")

    def test_catalog_json_generation(self):
        catalog_path = os.path.join(REPO_ROOT, "build", "catalog.json")
        self.assertTrue(os.path.exists(catalog_path), "catalog.json does not exist")

        with open(catalog_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
            self.assertIn("songs", data)
            self.assertGreater(data["count"], 0)

            song = data["songs"][0]
            self.assertEqual(song["id"], "stille_nacht")
            self.assertIsNotNone(song["assets"]["pdf"])
            self.assertIsNotNone(song["assets"]["abc"])
            self.assertIsNotNone(song["assets"]["mp3"])

if __name__ == "__main__":
    unittest.main()
