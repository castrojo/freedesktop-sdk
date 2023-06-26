kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/protobuf.bst

variables:
  # https://github.com/protocolbuffers/protobuf/issues/9916
  local_flags: -std=c++17

sources:
- kind: git_repo
  url: github:protobuf-c/protobuf-c.git
  track: v*
  ref: v1.4.1-0-gabc67a11c6db271bedbb9f58be85d6f4e2ea8389
