kind: autotools
description: Tool to help find memory-management problems in programs

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gdb.bst
- filename: components/perl.bst
  type: build

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
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/valgrind"
      mv "%{install-root}%{includedir}/valgrind/config.h" "%{install-root}%{includedir}/%{gcc_triplet}/valgrind/"

public:
  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_tag
  url: sourceware:valgrind.git
  track: master
  ref: VALGRIND_3_22_0-0-gbd4db67b1d386c352040b1d8fab82f5f3340fc59
- kind: patch
  path: patches/valgrind/valgrind-arm-hot_cpu.patch
