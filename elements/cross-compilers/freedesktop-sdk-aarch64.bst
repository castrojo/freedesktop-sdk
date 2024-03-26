kind: junction

config:
  options:
    bootstrap_build_arch: "%{target_arch}"
    target_arch: "aarch64"
  map-aliases: true

sources:
- kind: local
  path: project.conf
- kind: local
  path: elements
  directory: elements
- kind: local
  path: files
  directory: files
- kind: local
  path: patches
  directory: patches
- kind: local
  path: plugins
  directory: plugins
- kind: local
  path: include
  directory: include
- kind: local
  path: keys
  directory: keys
