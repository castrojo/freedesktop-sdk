kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_repo
  url: freedesktop-sdk-project:freedesktop-sdk.git
  ref: freedesktop-sdk-23.08beta.7-95-g9da3afe2ecbb39ca36f856c3754a3c1b72e12d4a
