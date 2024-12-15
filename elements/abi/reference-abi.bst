kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: fdsdk_git:freedesktop-sdk.git
  track: freedesktop-sdk-24.08*
  ref: freedesktop-sdk-24.08.8-0-gda0e3e5fe464e7f9f8cd5ed7830ed1ded1e9992b
