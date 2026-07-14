# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: Tool to help find memory-management problems in programs

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/perl.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gdb.bst
- components/zstd.bst

variables:
  # valgrind does not like the strong stack protector flag
  target_flags_stack_protector_strong: ''

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/valgrind"
      mv "%{install-root}%{includedir}/valgrind/config.h" "%{install-root}%{includedir}/%{gcc_triplet}/valgrind/"

sources:
- kind: git_repo
  url: sourceware:valgrind.git
  track: VALGRIND_*
  ref: VALGRIND_3_27_1-0-gb50f9a09ca65cc983c934bd0f50059304f3e939f
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
