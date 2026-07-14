#!/usr/bin/env python

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import configparser
import glob
import os
import re
import subprocess
import sys

CODECS_REG = re.compile(r"^ ([A-Z.]{6}) ([^ \=]+) +(.+)$", re.MULTILINE)
DECODERS_REG = re.compile(r" \(decoders: ([^)]+)\)")
ENCODERS_REG = re.compile(r" \(encoders: ([^)]+)\)")
ffprobe = "ffprobe"
ffmpeg = "ffmpeg"


def has_codecs_extra() -> bool:
    path = (
        "/run/flatpak/ld.so.conf.d/runtime-*-org.freedesktop.Platform.codecs-extra.conf"
    )
    return bool(glob.glob(path))


def get_stdout(command):
    return subprocess.run(command, check=True, text=True, capture_output=True).stdout


def get_codecs():
    output = get_stdout([ffprobe, "-hide_banner", "-codecs"])
    codecs = {
        codec.group(2): (codec.group(1), codec.group(3))
        for codec in CODECS_REG.finditer(output)
    }
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
    return {
        hwaccel.strip()
        for hwaccel in get_stdout([ffmpeg, "-hide_banner", "-hwaccels"]).split("\n")[1:]
        if hwaccel.strip()
    }


def get_codec_info(codec_type, codec_name):
    return [
        " ".join(i.split()[:2])
        for i in map(
            str.strip,
            get_stdout(
                ["ffmpeg", "-hide_banner", "-h", f"{codec_type}={codec_name}"]
            ).split("\n"),
        )
        if re.match(codec_type, i, re.IGNORECASE)
    ]


def is_flatpaked():
    return os.path.exists("/.flatpak-info")


if not is_flatpaked():
    print("Error: This script must be run inside Flatpak", file=sys.stderr)
    sys.exit(1)


# ideally this should be parsed with glib.keyfile but test needs to be
# light on dependencies and it is fine for getting simple values
def get_runtime_arch():
    config = configparser.ConfigParser()
    with open("/.flatpak-info", encoding="utf-8") as f:
        config.read_file(f)
    if config.has_section("Application"):
        runtime = config.get("Application", "runtime")
    else:
        runtime = config.get("Runtime", "runtime")

    return runtime.split("/")[2]


dec_only, enc_only, dec_and_enc, codecs_dict = get_codecs()

check_hw = {"vdpau", "vaapi", "drm", "vulkan", "cuda", "amf"}
if get_runtime_arch() != "x86_64":
    check_hw.remove("amf")
check_common = {
    "y41p",
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

# Sanity checks
print("Performing sanity checks...")
assert len(dec_and_enc) > 0, dec_and_enc
assert len(dec_only) > 0, dec_only
assert len(enc_only) > 0, enc_only
assert len(get_hwaccels()) > 0, get_hwaccels()
assert len(codecs_dict) > 0, codecs_dict

h264_decoders = get_codec_info("decoder", "h264")
h264_encoders = get_codec_info("encoder", "h264")
exp_h264_decoder_platform = ["Decoder h264"]
exp_h264_decoder_noext = []
exp_h264_encoder_platform = [
    "Encoder libx264",
    "Encoder libx264rgb",
    "Encoder h264_amf",
    "Encoder h264_nvenc",
    "Encoder h264_v4l2m2m",
    "Encoder h264_vaapi",
    "Encoder h264_vulkan",
]

exp_h264_encoder_noext = [
    "Encoder h264_amf",
    "Encoder h264_nvenc",
    "Encoder h264_v4l2m2m",
    "Encoder h264_vaapi",
]

hevc_decoders = get_codec_info("decoder", "hevc")
hevc_encoders = get_codec_info("encoder", "hevc")
exp_hevc_decoder_platform = ["Decoder hevc"]
exp_hevc_decoder_noext = []
exp_hevc_encoder_platform = [
    "Encoder libx265",
    "Encoder hevc_amf",
    "Encoder hevc_nvenc",
    "Encoder hevc_v4l2m2m",
    "Encoder hevc_vaapi",
    "Encoder hevc_vulkan",
]

exp_hevc_encoder_noext = [
    "Encoder hevc_amf",
    "Encoder hevc_nvenc",
    "Encoder hevc_v4l2m2m",
    "Encoder hevc_vaapi",
]

libx265_encoders = get_codec_info("encoder", "libx265")
exp_libx265_encoder_platform = ["Encoder libx265"]
exp_libx265_encoder_noext = []

av1_decoders = get_codec_info("decoder", "av1")
av1_encoders = get_codec_info("encoder", "av1")
exp_av1_decoder = ["Decoder av1"]
exp_av1_encoder_platform = [
    "Encoder libaom-av1",
    "Encoder libsvtav1",
    "Encoder av1_nvenc",
    "Encoder av1_amf",
    "Encoder av1_vaapi",
    "Encoder av1_vulkan",
]
exp_av1_encoder_noext = [
    "Encoder libaom-av1",
    "Encoder libsvtav1",
    "Encoder av1_nvenc",
    "Encoder av1_amf",
    "Encoder av1_vaapi",
]

vp8_decoders = get_codec_info("decoder", "vp8")
vp8_encoders = get_codec_info("encoder", "vp8")
exp_vp8_decoder = ["Decoder vp8"]
exp_vp8_encoder = ["Encoder libvpx", "Encoder vp8_v4l2m2m", "Encoder vp8_vaapi"]

vp9_decoders = get_codec_info("decoder", "vp9")
vp9_encoders = get_codec_info("encoder", "vp9")
exp_vp9_decoder = ["Decoder vp9"]
exp_vp9_encoder = ["Encoder libvpx-vp9", "Encoder vp9_vaapi"]

if get_runtime_arch() == "riscv64":
    check_hw.remove("cuda")
    exp_h264_encoder_platform.remove("Encoder h264_nvenc")
    exp_h264_encoder_noext.remove("Encoder h264_nvenc")
    exp_hevc_encoder_platform.remove("Encoder hevc_nvenc")
    exp_hevc_encoder_noext.remove("Encoder hevc_nvenc")
    exp_av1_encoder_platform.remove("Encoder av1_nvenc")
    exp_av1_encoder_noext.remove("Encoder av1_nvenc")

if get_runtime_arch() != "x86_64":
    exp_h264_encoder_platform.remove("Encoder h264_amf")
    exp_h264_encoder_noext.remove("Encoder h264_amf")
    exp_hevc_encoder_platform.remove("Encoder hevc_amf")
    exp_hevc_encoder_noext.remove("Encoder hevc_amf")
    exp_av1_encoder_platform.remove("Encoder av1_amf")
    exp_av1_encoder_noext.remove("Encoder av1_amf")

# Common to both codecs-extra and platform ffmpeg

print("Performing common checks...")

assert check_hw.issubset(get_hwaccels()), get_hwaccels()
assert check_common.issubset(dec_and_enc), check_common - dec_and_enc

assert av1_decoders == exp_av1_decoder, av1_decoders

assert vp8_decoders == exp_vp8_decoder, vp8_decoders
assert vp8_encoders == exp_vp8_encoder, vp8_encoders

assert vp9_decoders == exp_vp9_decoder, vp9_decoders
assert vp9_encoders == exp_vp9_encoder, vp9_encoders

# Platform ffmpeg with codecs-extra

if has_codecs_extra():
    print("Performing platform ffmpeg with codecs-extra checks...")

    assert all(x in dec_and_enc for x in ["hevc", "h264"]), dec_and_enc
    assert all(x in dec_only for x in ["vvc", "vc1"]), dec_only

    assert av1_encoders == exp_av1_encoder_platform, av1_encoders

    assert h264_decoders == exp_h264_decoder_platform, h264_decoders
    assert h264_encoders == exp_h264_encoder_platform, h264_encoders

    assert hevc_decoders == exp_hevc_decoder_platform, hevc_decoders
    assert hevc_encoders == exp_hevc_encoder_platform, hevc_encoders
    assert libx265_encoders == exp_libx265_encoder_platform, libx265_encoders

# Platform ffmpeg without codecs-extra

if not has_codecs_extra():
    print("Performing platform ffmpeg without codecs-extra checks...")

    assert all(x not in dec_and_enc for x in ["hevc", "vvc", "vc1"]), dec_and_enc
    assert all(x not in dec_only for x in ["hevc", "vvc", "vc1"]), dec_only
    assert all(x not in enc_only for x in ["vvc", "vc1"]), enc_only

    assert av1_encoders == exp_av1_encoder_noext, av1_encoders

    assert h264_decoders == exp_h264_decoder_noext, h264_decoders
    assert h264_encoders == exp_h264_encoder_noext, h264_encoders

    assert hevc_decoders == exp_hevc_decoder_noext, hevc_decoders
    assert hevc_encoders == exp_hevc_encoder_noext, hevc_encoders

    assert libx265_encoders == exp_libx265_encoder_noext, libx265_encoders
