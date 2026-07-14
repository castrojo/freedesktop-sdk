# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- components/linux-pam-base.bst
- components/python3-setuptools.bst
- components/python3.bst
- components/swig.bst

variables:
  # apparmor has a very complex build stack that makes it hard
  # to use build-dir so we disable it
  build-dir: ''
  conf-link-args: --enable-shared --enable-static
  conf-cmd: ./configure --with-python
  make: make -C libraries/libapparmor
  make-install: make -j1 -C libraries/libapparmor install DESTDIR='%{install-root}'
  autogen: "true"

  other-make-args: >-
    SBINDIR='%{install-root}%{sbindir}'
    USR_SBINDIR='%{install-root}%{sbindir}'
    APPARMOR_BIN_PREFIX='%{install-root}%{indep-libdir}/apparmor'
    SECDIR='%{install-root}%{indep-libdir}/security'
    BINDIR='%{install-root}%{bindir}'

  other-make: make %{other-make-args}
  other-make-install: make -j1 %{other-make-args} install DESTDIR='%{install-root}'
  subdirs: >-
    binutils
    parser
    utils
    changehat/pam_apparmor
    profiles

config:
  configure-commands:
  - |
    cd libraries/libapparmor && autoreconf -fiv && %{configure}

  build-commands:
    (>):
    - |
      for dir in %{subdirs}; do
        %{other-make} -C "${dir}"
      done

  install-commands:
    (>):
    - |
      for dir in %{subdirs}; do
        case "${dir}" in
          parser)
            extra_args=("install-systemd")
            ;;
          *)
            extra_args=()
            ;;
        esac
        %{other-make-install} -C "${dir}" "${extra_args[@]}"
      done

    - |
      rm "%{install-root}%{libdir}"/libapparmor.a

public:
  bst:
    split-rules:
      libapparmor:
      - '%{includedir}'
      - '%{includedir}/**'
      - '%{libdir}/libapparmor.*'
      - '%{libdir}/pkgconfig/libapparmor.pc'
  cpe:
    product: apparmor
    ignored:
    - CVE-2016-1585

sources:
- kind: git_repo
  track: v*
  exclude:
  - "*beta*"
  - "*alpha*"
  - "*cherry-pick*"
  - "*rc*"
  # non-LTS
  - "v5.0.*"
  url: gitlab:apparmor/apparmor.git
  ref: v4.1.7-0-g9676b7aa934408748de2aaebad8680e69d7c3912
