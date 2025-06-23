kind: autotools
description: Tool to help find memory-management problems in programs

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/perl.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: VALGRIND_3_26_0-0-g218cee2feb2556b6b4b8991cf0977256b801e3e5
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
