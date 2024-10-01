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
    codecs = {l.group(2): (l.group(1), l.group(3)) for l in CODECS_REG.finditer(output)}
    decoders_only = set()
    encoders_only = set()
    decoders_and_encoders = set()
    codecs_dict = {}
    for codec, desc in codecs.items():
        decoders_impl = DECODERS_REG.search(desc[1])
        encoders_impl = ENCODERS_REG.search(desc[1])
        codecs_dict[codec] = {
            "decoders": decoders_impl and decoders_impl.group(1).split(),
            "encoders": encoders_impl and encoders_impl.group(1).split(),
        }
        if desc[0][0] == "D" and "E" not in desc[0]:
            decoders_only.add(codec)
        if desc[0][0] == "D" and desc[0][1] == "E":
            decoders_and_encoders.add(codec)
        if desc[0][0] == "." and desc[0][1] == "E" and "D" not in desc[0]:
            encoders_only.add(codec)

    return decoders_only, encoders_only, decoders_and_encoders, codecs_dict


def get_hwaccels():
    return set(
        hwaccel.strip()
        for hwaccel in get_stdout([ffmpeg, "-hide_banner", "-hwaccels"]).split("\n")[1:]
        if hwaccel.strip()
    )


def get_codec_info(codec_type, codec_name):
    return [
        " ".join(i.split()[:2])
        for i in map(
            str.strip,
            get_stdout(
                ["ffmpeg", "-hide_banner", "-h", "=".join([codec_type, codec_name])]
            ).split("\n"),
        )
        if re.match(codec_type, i, re.I)
    ]


dec_only, enc_only, dec_and_enc, codecs_dict = get_codecs()

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

assert len(dec_and_enc) > 0
assert len(dec_only) > 0
assert len(enc_only) > 0
assert len(get_hwaccels()) > 0
assert len(codecs_dict) > 0

# Common to both ffmpeg-full and platform ffmpeg

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

# Only platform ffmpeg

if os.path.exists("/.flatpak-info") and not os.path.exists("/app/lib/ffmpeg"):
    try:
        assert codecs_dict["h264"]["decoders"] == ["libopenh264"]
    except AssertionError as e:
        print(f'{codecs_dict["h264"]["decoders"]}')
        raise e
    try:
        assert codecs_dict["h264"]["encoders"] == [
            "libopenh264",
            "h264_v4l2m2m",
            "h264_vaapi",
        ]
    except AssertionError as e:
        print(f'{codecs_dict["h264"]["encoders"]}')
        raise e
    try:
        assert all(x not in dec_and_enc for x in ["hevc", "vvc", "vc1"])
    except AssertionError as e:
        print(f"{dec_and_enc}")
        raise e
    try:
        assert all(x not in dec_only for x in ["hevc", "vvc", "vc1"])
    except AssertionError as e:
        print(f"{dec_only}")
        raise e
    try:
        assert all(x not in enc_only for x in ["vvc", "vc1"])
    except AssertionError as e:
        print(f"{enc_only}")
        raise e
    try:
        assert codecs_dict["hevc"]["encoders"] == ["hevc_v4l2m2m", "hevc_vaapi"]
    except AssertionError as e:
        print(f'{codecs_dict["hevc"]["encoders"]}')
        raise e
    try:
        assert codecs_dict["hevc"]["decoders"] is None
    except AssertionError as e:
        print(f'{codecs_dict["hevc"]["decoders"]}')
        raise e
    try:
        assert len(get_codec_info("encoder", "libx265")) == 0
    except AssertionError as e:
        print(get_codec_info("encoder", "libx265"))
        raise e
    try:
        assert get_codec_info("decoder", "h264") == ["Decoder libopenh264"]
    except AssertionError as e:
        print(get_codec_info("decoder", "h264"))
        raise e
    try:
        assert get_codec_info("encoder", "h264") == [
            "Encoder libopenh264",
            "Encoder h264_v4l2m2m",
            "Encoder h264_vaapi",
        ]
    except AssertionError as e:
        print(get_codec_info("encoder", "h264"))
        raise e
    try:
        assert get_codec_info("decoder", "av1") == ["Decoder av1"]
    except AssertionError as e:
        print(get_codec_info("decoder", "av1"))
        raise e
    try:
        assert get_codec_info("encoder", "av1") == [
            "Encoder libaom-av1",
            "Encoder libsvtav1",
            "Encoder av1_vaapi",
        ]
    except AssertionError as e:
        print(get_codec_info("encoder", "av1"))
        raise e
    try:
        assert get_codec_info("encoder", "vp8") == [
            "Encoder libvpx",
            "Encoder vp8_v4l2m2m",
            "Encoder vp8_vaapi",
        ]
    except AssertionError as e:
        print(get_codec_info("encoder", "vp8"))
        raise e
    try:
        assert get_codec_info("decoder", "vp8") == ["Decoder vp8"]
    except AssertionError as e:
        print(get_codec_info("decoder", "vp8"))
        raise e
    try:
        assert get_codec_info("encoder", "vp9") == [
            "Encoder libvpx-vp9",
            "Encoder vp9_vaapi",
        ]
    except AssertionError as e:
        print(get_codec_info("encoder", "vp9"))
        raise e
    try:
        assert get_codec_info("decoder", "vp9") == ["Decoder vp9"]
    except AssertionError as e:
        print(get_codec_info("decoder", "vp9"))
        raise e

# Only ffmpeg-full extension

if os.path.exists("/.flatpak-info") and os.path.exists("/app/lib/ffmpeg"):
    try:
        assert codecs_dict["h264"]["decoders"] == [
            "h264",
            "h264_v4l2m2m",
            "libopenh264",
        ]
    except AssertionError as e:
        print(f'{codecs_dict["h264"]["decoders"]}')
        raise e
    try:
        assert codecs_dict["h264"]["encoders"] == [
            "libx264",
            "libx264rgb",
            "libopenh264",
            "h264_v4l2m2m",
            "h264_vaapi",
        ]
    except AssertionError as e:
        print(f'{codecs_dict["h264"]["encoders"]}')
        raise e
    try:
        assert get_codec_info("encoder", "libx265") == ["Encoder libx265"]
    except AssertionError as e:
        print(get_codec_info("encoder", "libx265"))
        raise e
    try:
        assert get_codec_info("decoder", "h264") == ["Decoder h264"]
    except AssertionError as e:
        print(get_codec_info("decoder", "h264"))
        raise e
    try:
        assert get_codec_info("encoder", "h264") == [
            "Encoder libx264",
            "Encoder libx264rgb",
            "Encoder libopenh264",
            "Encoder h264_v4l2m2m",
            "Encoder h264_vaapi",
        ]
    except AssertionError as e:
        print(get_codec_info("encoder", "h264"))
        raise e
    try:
        assert get_codec_info("decoder", "av1") == ["Decoder av1"]
    except AssertionError as e:
        print(get_codec_info("decoder", "av1"))
        raise e
    try:
        assert get_codec_info("encoder", "av1") == [
            "Encoder libaom-av1",
            "Encoder libsvtav1",
            "Encoder av1_vaapi",
        ]
    except AssertionError as e:
        print(get_codec_info("encoder", "av1"))
        raise e
    try:
        assert get_codec_info("encoder", "vp8") == [
            "Encoder libvpx",
            "Encoder vp8_v4l2m2m",
            "Encoder vp8_vaapi",
        ]
    except AssertionError as e:
        print(get_codec_info("encoder", "vp8"))
        raise e
    try:
        assert get_codec_info("decoder", "vp8") == ["Decoder vp8"]
    except AssertionError as e:
        print(get_codec_info("decoder", "vp8"))
        raise e
    try:
        assert get_codec_info("encoder", "vp9") == [
            "Encoder libvpx-vp9",
            "Encoder vp9_vaapi",
        ]
    except AssertionError as e:
        print(get_codec_info("encoder", "vp9"))
        raise e
    try:
        assert get_codec_info("decoder", "vp9") == ["Decoder vp9"]
    except AssertionError as e:
        print(get_codec_info("decoder", "vp9"))
        raise e
