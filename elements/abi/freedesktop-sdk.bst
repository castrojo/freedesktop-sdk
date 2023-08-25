kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: master
  ref: freedesktop-sdk-23.08rc.1-82-g2d230fcbfa33b64547a0f50c6d1ab14f2b8ae95b
