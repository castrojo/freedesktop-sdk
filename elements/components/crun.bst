# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/gperf.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst
- components/json-c.bst
- components/libcap.bst
- components/libseccomp.bst
- components/systemd-libs.bst

variables:
  (?):
  - target_arch == "riscv64":
      # incredibly racy on riscv64
      notparallel: True

sources:
- kind: git_repo
  url: github:containers/crun.git
  track: '*.*'
  ref: 1.29-0-gd66af6a0fc2ab5fabd951b427a292344632ce074
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: 872b8b0b7ccb1a121601ede0dcac8c6b8a1008a6
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: d64c1d945da7cf6970061c7c9ff4391fafdf2a15
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: 26647a49f642c7d22a1cd3aa0a48e4650a542269
# backport of https://github.com/containers/crun/pull/2102
- kind: patch
  path: patches/crun/0001-build-export-json_gen_-symbols.patch
