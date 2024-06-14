kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: freedesktop-sdk-22.08.*
  ref: freedesktop-sdk-22.08.25-0-g9778c39a5c93b78d13258e91375f989ec39a1ff4
