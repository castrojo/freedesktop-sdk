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
    patches:
    - CVE-2024-22365

sources:
- kind: tar
  url: github_files:linux-pam/linux-pam/releases/download/v1.5.3/Linux-PAM-1.5.3.tar.xz
  ref: 7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283
- kind: patch
  path: patches/linux-pam/CVE-2024-22365.patch
