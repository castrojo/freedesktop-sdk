kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst

variables:
  conf-local: >-
    --includedir="%{includedir}/security"
  make-args: sepermitlockdir=/run/sepermit
  make: "make %{make-args}"
  make-install: "make %{make-args} -j1 install DESTDIR='%{install-root}'"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpam.so'
        - '%{libdir}/libpam_misc.so'
        - '%{libdir}/libpamc.so'
      vm-only:
        # Most of this is only useful for VM.
        # We keep only libraries for dependencies.
      - '%{sysconfdir}'
      - '%{sysconfdir}/**'
      - '%{bindir}'
      - '%{bindir}/**'
      - '%{datadir}'
      - '%{datadir}/**'
  cpe:
    product: linux-pam

sources:
- kind: tar
  url: github_files:linux-pam/linux-pam/releases/download/v1.4.0/Linux-PAM-1.4.0.tar.xz
  ref: cd6d928c51e64139be3bdb38692c68183a509b83d4f2c221024ccd4bcddfd034
