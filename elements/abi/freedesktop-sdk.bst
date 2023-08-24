kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: master
  ref: freedesktop-sdk-23.08rc.1-74-g8f53503d55512a4469fdd96f86cc2f580b85155d
