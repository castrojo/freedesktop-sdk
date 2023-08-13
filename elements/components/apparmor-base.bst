kind: autotools

build-depends:
- components/bison.bst
- components/flex.bst
- components/gettext.bst
- components/perl-pod-parser.bst
- components/python3.bst
- components/which.bst
- components/linux-pam-base.bst

variables:
  builddir: ''
  conf-link-args: --enable-shared --enable-static
  conf-cmd: ./configure
  make: make -C libraries/libapparmor
  make-install: make -C libraries/libapparmor -j1 install DESTDIR='%{install-root}'
  autogen: "true"

  other-make-args: >-
    SBINDIR='%{install-root}%{sbindir}'
    USR_SBINDIR='%{install-root}%{sbindir}'
    APPARMOR_BIN_PREFIX='%{install-root}%{indep-libdir}/apparmor'
    SECDIR='%{install-root}%{indep-libdir}/security'
    BINDIR='%{install-root}%{bindir}'

  other-make: make %{other-make-args}
  other-make-install: make %{other-make-args} -j1 install DESTDIR='%{install-root}'
  subdirs: >-
    binutils
    parser
    utils
    changehat/pam_apparmor
    profiles

config:
  configure-commands:
  - |
    cd libraries/libapparmor && %{configure}

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

sources:
- kind: tar
  url: tar_https:launchpad.net/apparmor/3.0/3.0.3/+download/apparmor-3.0.3.tar.gz
  ref: 153db05d8f491e0596022663c19fb1166806cb473b3c6f0a7279feda2ec25a59
