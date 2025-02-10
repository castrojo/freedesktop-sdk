kind: autotools

depends:
- components/audit.bst
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst

variables:
  conf-local: >-
    --includedir="%{includedir}/security"
    --enable-lastlog
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
- kind: git_repo
  url: github:linux-pam/linux-pam.git
  track: v*
  ref: v1.6.1-0-g9438e084e2b318bf91c3912c0b8ff056e1835486
