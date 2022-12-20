kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  # Before declaring stable ABI, set tracking for this element to the tag
  # pattern for the release (for example freedesktop-sdk-23.08.*)
