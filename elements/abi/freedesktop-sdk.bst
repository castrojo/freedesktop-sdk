kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: freedesktop-sdk-22.08.*
  ref: freedesktop-sdk-22.08.27-31-g4e9b3b0d85d31e14d0fed5e461b868fcfd38ea85
