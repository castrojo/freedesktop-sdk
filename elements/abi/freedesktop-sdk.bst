kind: junction

config:
  options:
    bootstrap_build_arch: "%{sandbox_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/21.08
  ref: freedesktop-sdk-21.08.17.1-0-gac099d940868f3b3821f84510d3989f836a817ac
