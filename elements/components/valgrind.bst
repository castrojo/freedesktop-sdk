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
- kind: git_repo
  url: sourceware:valgrind.git
  track: VALGRIND_*
  ref: VALGRIND_3_25_1-0-g4441567fbec8c263e1624b49ba86572d4cccfccd
