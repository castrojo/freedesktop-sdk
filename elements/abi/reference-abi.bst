kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: fdsdk_git:freedesktop-sdk.git
  track: freedesktop-sdk-25.08*
  ref: freedesktop-sdk-25.08.3-0-g4a527662788a742074839b162326761eca00e3a4
