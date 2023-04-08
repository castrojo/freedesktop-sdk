kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: release/22.08
  ref: freedesktop-sdk-22.08.9-159-g4d3424b7e54300a1815ea1e51e71e1f9f7b43f86
