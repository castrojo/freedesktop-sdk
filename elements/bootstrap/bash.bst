kind: autotools
description: GNU Bash

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/readline.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/readline.bst

(@): elements/bootstrap/include/target.yml

variables:
  local_flags: -std=gnu17
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
    bash_cv_dev_fd=standard
    bash_cv_dev_stdin=present

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
        - '%{libdir}/bash/Makefile.sample'

  cpe:
    vendor: 'gnu'
    patches:
    - CVE-2019-18276

sources:
- kind: git_repo
  url: savannah:bash.git
  # bash doesn't provide patch releases, and just commits patches
  # to git. We track master to get those latest fixes without having
  # to backport them one by one.
  # When reviewing an update, please review what patches it introduces
  track: master
  ref: bash-5.2-39-g6794b5478f660256a1023712b5fc169196ed0a22

