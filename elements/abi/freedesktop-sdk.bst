kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  track: freedesktop-sdk-22.08.*
  ref: freedesktop-sdk-22.08.24-30-g1428bdf64d7bbe2027c22b16c126e0ea4f4ad2e6
