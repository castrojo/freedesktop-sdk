kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: release/22.08
  ref: freedesktop-sdk-22.08.5-50-ge932335e4a03d544c473931f69a071c6fadea630
