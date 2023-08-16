kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  ref: freedesktop-sdk-23.08rc.1-0-geea63deafd1360c6caccd006cbbba40b7fa73094
