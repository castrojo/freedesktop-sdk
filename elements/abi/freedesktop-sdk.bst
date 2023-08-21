kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: master
  ref: freedesktop-sdk-23.08rc.1-40-ga43ce6f22a28016a2d52e94507dfd2b795aa9e07
