kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: freedesktop-sdk-23.08*
  ref: freedesktop-sdk-23.08.11-0-g2ad72aa8df3b264edde46d5015ed0b598ff90a1c
