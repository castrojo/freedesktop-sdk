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
  ref: v1.7.0-0-gea980d991196df67cdd56b3f65d210b73218d08a
