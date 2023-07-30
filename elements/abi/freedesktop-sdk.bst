kind: junction

config:
  options:
    bootstrap_build_arch: "%{sandbox_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/21.08
  ref: freedesktop-sdk-21.08.20.1-0-g51a8ec0bbc67e019358a9a26e4691d29c1998b4e
