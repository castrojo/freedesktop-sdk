#!/usr/bin/env python

import re
import subprocess
import os

CODECS_REG = re.compile(r"^ ([A-Z.]{6}) ([^ \=]+) +(.+)$", re.M)
DECODERS_REG = re.compile(r" \(decoders: ([^)]+)\)")
ENCODERS_REG = re.compile(r" \(encoders: ([^)]+)\)")
ffprobe = "ffprobe"
ffmpeg = "ffmpeg"


def get_stdout(command):
    return subprocess.run(command, check=True, text=True, capture_output=True).stdout


def get_codecs():
    output = get_stdout([ffprobe, "-hide_banner", "-codecs"])
    codecs = {l.group(2): l.group(1) for l in CODECS_REG.finditer(output)}
    decoders_only = set()
    encoders_only = set()
    decoders_and_encoders = set()
    for codec, desc in codecs.items():
        if desc[0] == "D" and "E" not in desc:
            decoders_only.add(codec)
        if desc[0] == "D" and desc[1] == "E":
            decoders_and_encoders.add(codec)
        if desc[0] == "." and desc[1] == "E" and "D" not in desc:
            encoders_only.add(codec)

    return decoders_only, encoders_only, decoders_and_encoders


def get_hwaccels():
    return set(
        hwaccel.strip()
        for hwaccel in get_stdout([ffmpeg, "-hide_banner", "-hwaccels"]).split("\n")[1:]
        if hwaccel.strip()
    )


dec_only, enc_only, dec_and_enc = get_codecs()

check_hw = {"vdpau", "vaapi", "drm", "vulkan"}
check_common = {
    "y41p",
    "h264",
    "ffv1",
    "png",
    "mp3",
    "tiff",
    "mpeg2video",
    "vorbis",
    "vp8",
    "wmv1",
    "opus",
    "mpeg4",
    "gif",
    "vp9",
    "jpeg2000",
    "webvtt",
    "ass",
    "flac",
    "yuv4",
    "webp",
    "apng",
    "bmp",
    "h263",
    "av1",
}
check_ext_only = {"hevc"}

assert len(dec_and_enc) > 0
assert len(dec_only) > 0
assert len(enc_only) > 0
assert len(get_hwaccels()) > 0

try:
    assert check_hw.issubset(get_hwaccels())
except AssertionError as e:
    print(f"{check_hw} != {get_hwaccels()}")
    raise e

try:
    assert check_common.issubset(dec_and_enc)
except AssertionError as e:
    print(f"check_common != dec_and_enc: {check_common - dec_and_enc}")
    raise e


if os.path.exists("/.flatpak-info") and os.path.exists("/app/lib/ffmpeg"):
    try:
        assert check_ext_only.issubset(dec_and_enc)
    except AssertionError as e:
        print(f"check_ext_only != dec_and_enc: {check_ext_only - dec_and_enc}")
        raise e
