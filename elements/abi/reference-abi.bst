# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: fdsdk_git:freedesktop-sdk.git
  track: freedesktop-sdk-26.08*
  ref: freedesktop-sdk-26.08rc.2-0-g6208c5c0b1250c7b69a4a9ee8a23fc43145e7df5
