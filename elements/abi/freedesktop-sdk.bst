kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: release/22.08
  ref: freedesktop-sdk-22.08.7-0-g957a3107c1a1576c6d725db54f34bcfa87bf760c
