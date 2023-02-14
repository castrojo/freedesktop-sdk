kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: release/22.08
  ref: freedesktop-sdk-22.08.7-52-g8d2e0aeea780b800940bb72286fc4b1d782ca25b
