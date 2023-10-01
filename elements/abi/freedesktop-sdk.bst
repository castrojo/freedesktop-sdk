kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: freedesktop-sdk-23.08*
  ref: freedesktop-sdk-23.08.1-65-g0e9d93add5e7c5e7b4ed765c243167e19eebc32d
