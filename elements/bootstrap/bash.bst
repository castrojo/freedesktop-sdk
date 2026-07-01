# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU Bash

(@):
- elements/bootstrap/include/target.yml

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
  ref: bash-5.3-16-gb460816602167718f78a6233164e8875f49b75b2
- kind: patch
  path: patches/bash/0001-bash-config.patch
