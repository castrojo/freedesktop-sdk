kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: freedesktop-sdk-project:freedesktop-sdk.git
  # When creating release, release branch must be tracked to get a ref
