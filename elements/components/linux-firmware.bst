# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/_private/git-minimal.bst
- components/parallel.bst
- components/python3.bst
- components/rdfind.bst
- components/which.bst
- components/zstd.bst

depends:
- public-stacks/runtime-minimal.bst

environment:
  MAX_JOBS: '%{max-jobs}'

environment-nocache:
- MAX_JOBS

variables:
  license-files-extra: WHENCE MIT
  strip-binaries: ''

  make-args: >-
    PREFIX="%{prefix}"
    FIRMWAREDIR="%{indep-libdir}/firmware"
    NUM_JOBS="$MAX_JOBS"

  make: ''
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install-zst dedup

public:
  bst:
    split-rules:
      doc:
        (>):
        - '%{indep-libdir}/firmware/**/README*'

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: '[0-9]*'
  ref: 20261124-0-gc46910a4cbd8332ac45205424c5383dfbcb99ac5
