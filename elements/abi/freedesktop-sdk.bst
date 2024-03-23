kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: release/22.08
  ref: freedesktop-sdk-22.08.23-0-gc0e6b712b98d6fb7c3d9dd5efe1e79b94f2f5125
