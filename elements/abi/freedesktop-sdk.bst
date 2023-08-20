kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  ref: freedesktop-sdk-23.08rc.1-34-g69d728f94e439e64a650e3c9e884b2bd82e9d45e
