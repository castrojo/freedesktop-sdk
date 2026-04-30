kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: fdsdk_git:freedesktop-sdk.git
  track: freedesktop-sdk-25.08*
  ref: freedesktop-sdk-25.08.11-0-g30517eb37d146e6dcfa1b0e9337ff835e3473ee5
