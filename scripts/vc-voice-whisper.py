#!/usr/bin/env -S /home/blackarch/.local/venvs/vc/bin/python3
"""
vc-voice-whisper — Yerli Whisper (openai-whisper) ilə səs tanıma.
İstifadə:
  vc-voice-whisper [duration]   # default: 5 saniyə
"""
import sys
import os
import subprocess
import tempfile
from pathlib import Path

# Suppress whisper warnings
os.environ["TRANSFORMERS_VERBOSITY"] = "error"
import warnings
warnings.filterwarnings("ignore")

import whisper

DURATION = int(sys.argv[1]) if len(sys.argv) > 1 else 5
MODEL_NAME = os.environ.get("VC_WHISPER_MODEL", "base")  # tiny/base/small/medium/large

def record(seconds, output_path):
    """Record audio via available tool (ffmpeg/parecord/pw-record)."""
    import shutil
    if shutil.which("ffmpeg"):
        # ffmpeg + pulse (pipewire-pulse uyğun) — universal
        subprocess.run(
            ["ffmpeg", "-loglevel", "error", "-y",
             "-f", "pulse", "-i", "default",
             "-t", str(seconds),
             "-ac", "1", "-ar", "16000",
             output_path],
            check=True, stderr=subprocess.DEVNULL
        )
    elif shutil.which("parecord"):
        subprocess.run(
            ["parecord", "--rate=16000", "--channels=1", "--format=s16le",
             "--file-format=wav", "--record-time", str(seconds),
             output_path],
            check=True, stderr=subprocess.DEVNULL
        )
    elif shutil.which("arecord"):
        subprocess.run(
            ["arecord", "-q", "-d", str(seconds), "-f", "S16_LE",
             "-c", "1", "-r", "16000", output_path],
            check=True, stderr=subprocess.DEVNULL
        )
    else:
        raise RuntimeError("No audio recording tool (ffmpeg/parecord/arecord)")

def transcribe(audio_path, model_name="base"):
    """Transcribe with openai-whisper. Auto-detect AZ/EN/TR/RU."""
    model = whisper.load_model(model_name)
    result = model.transcribe(audio_path, fp16=False, language=None)
    return result.get("text", "").strip(), result.get("language", "?")

def main():
    print(f"🎙️  {DURATION} saniyə danış... (model: {MODEL_NAME})", file=sys.stderr)

    with tempfile.NamedTemporaryFile(suffix=".wav", delete=False) as tmp:
        audio_path = tmp.name

    try:
        record(DURATION, audio_path)
        print("⏳ Whisper transkripsiya edir...", file=sys.stderr)
        text, lang = transcribe(audio_path, MODEL_NAME)
        print(f"📝 [{lang}] {text}", file=sys.stderr)
        # stdout: yalnız mətn (komanda parsing üçün)
        print(text)
    except subprocess.CalledProcessError as e:
        print(f"❌ arecord səhvi: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"❌ {e}", file=sys.stderr)
        sys.exit(1)
    finally:
        Path(audio_path).unlink(missing_ok=True)

if __name__ == "__main__":
    main()
