kind: autotools

build-depends:
- components/bison.bst
- components/flex.bst
- components/gettext.bst
- components/perl-pod-parser.bst
- components/python3.bst
- components/python3-setuptools.bst
- components/which.bst
- components/linux-pam-base.bst

variables:
  # apparmor has a very complex build stack that makes it hard
  # to use build-dir so we disable it
  build-dir: ''
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
  url: tar_https:launchpad.net/apparmor/3.1/3.1.6/+download/apparmor-3.1.6.tar.gz
  ref: d5d699fd43faffd924dd51bfb5781a5a7cbabb55c1c9cb4abfb8c2840a9e8fcd
