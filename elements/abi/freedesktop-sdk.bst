kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: freedesktop-sdk-22.08.*
  ref: freedesktop-sdk-22.08.24-270-ge80e4e91652e9ec52c32c5a31db44fb599a81a70
