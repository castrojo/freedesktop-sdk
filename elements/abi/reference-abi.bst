kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: fdsdk_git:freedesktop-sdk.git
  track: freedesktop-sdk-24.08*
  ref: freedesktop-sdk-24.08.1-0-gb1a8aa87c560f19e725073b710fe7eee0117393b
