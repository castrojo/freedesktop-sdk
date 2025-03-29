kind: autotools
description: GNU coreutils

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/coreutils-manpages.bst
- bootstrap/gnu-config.bst
- filename:
  - bootstrap/acl.bst
  - bootstrap/libselinux.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/acl.bst
- bootstrap/libselinux.bst

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/coreutils-source.yml

environment:
  FORCE_UNSAFE_CONFIGURE: "1"

variables:
  conf-local: >-
    --enable-install-program=hostname,arch
    --enable-no-install-program=kill,uptime,groups
    --enable-acl
    ac_cv_func_chown_works=yes
    gl_cv_func_chown_slash_works=yes
    gl_cv_func_chown_ctime_works=yes
    gl_cv_func_chown_follows_symlink=yes

  make-install: make -j1 install DESTDIR="%{install-root}" INSTALL=install

config:
  build-commands:
    (<):
    - |
      mkdir -p "%{build-dir}/man"
      cp /coreutils-manpages/man1/* "%{build-dir}/man/"

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  cpe:
    ignored:
    - CVE-2016-2781

sources:
  (>):
  - kind: patch
    path: patches/coreutils/coreutils-no-man-deps.patch
