kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- components/python3.bst
- components/python3-setuptools.bst
- components/linux-pam-base.bst
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
    ignored:
    - CVE-2016-1585

sources:
- kind: tar
  url: tar_https:launchpad.net/apparmor/3.1/3.1.7/+download/apparmor-3.1.7.tar.gz
  ref: c6c161d6dbd99c2f10758ff347cbc6848223c7381f311de62522f22b0a16de64
