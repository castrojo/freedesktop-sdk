kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: freedesktop-sdk-22.08.*
  ref: freedesktop-sdk-22.08.26-0-g39e33330a6166a3dc2e3e20f5cdccff7a7a1dd9a
