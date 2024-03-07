kind: autotools
description: GNU Bash

build-depends:
- bootstrap/bash-build-deps.bst

runtime-depends:
- bootstrap/readline.bst


(@): elements/bootstrap/include/target.yml

variables:
  # bash_cv_termcap_lib is for working around undetected of libtinfo
  # because termcap is detected
  conf-local: >-
    CC_FOR_BUILD=/usr/bin/gcc
    --with-curses
    --with-installed-readline="%{sysroot}%{prefix}"
    --enable-job-control
    --without-bash-malloc
    ac_cv_rl_version=8.0
    bash_cv_getcwd_malloc=yes
    bash_cv_job_control_missing=present
    bash_cv_termcap_lib=libtinfo

config:
  build-commands:
    # The current build tries to build "build" binaries with "host"
    # include directories. So it does not find the right headers.
    # Those tools are source code generators. We build them first
    # disabling that some include directories.
    (<):
    - |
      cd "%{build-dir}"
      make RL_INCLUDEDIR=/non-existant mksyntax bashversion mksignames recho zecho printenv xcase
      make RL_INCLUDEDIR=/non-existant -C builtins mkbuiltins psize.aux

  install-commands:
    (>):
    - |
      ln -s bash "%{install-root}%{bindir}/sh"

    - |
      rm "%{install-root}%{infodir}/dir"

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/bash"
      mv "%{install-root}%{includedir}/bash/config.h" "%{install-root}%{includedir}/%{gcc_triplet}/bash/"
      mv "%{install-root}%{includedir}/bash/signames.h" "%{install-root}%{includedir}/%{gcc_triplet}/bash/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/bash/loadables.h'
        - '%{libdir}/bash/Makefile.inc'

  cpe:
    vendor: 'gnu'
    patches:
    - CVE-2019-18276
    - CVE-2022-3715

sources:
- kind: git_tag
  url: savannah:bash.git
  ref: bash-5.1-18-g9439ce094c9aa7557a9d53ac7b412a23aa66e36b
- kind: patch
  path: patches/bash/CVE-2022-3715.patch
