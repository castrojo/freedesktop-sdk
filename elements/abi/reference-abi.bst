kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: fdsdk_git:freedesktop-sdk.git
  track: freedesktop-sdk-24.08*
  ref: freedesktop-sdk-24.08.27-130-g6bc67f5be96dc3834884dac7adf81b93aa9a524b
