kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: fdsdk_git:freedesktop-sdk.git
  track: freedesktop-sdk-24.08*
  ref: freedesktop-sdk-24.08.24-0-g83c1b59a94e6c951ba7baa93e430cf95f0e226e0
