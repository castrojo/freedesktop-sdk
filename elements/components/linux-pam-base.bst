kind: autotools

depends:
- components/audit.bst
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst

variables:
  conf-local: >-
    --includedir="%{includedir}/security"
    --enable-lastlog
  make-args: sepermitlockdir=/run/sepermit

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
  url: github_files:linux-pam/linux-pam/releases/download/v1.6.1/Linux-PAM-1.6.1.tar.xz
  ref: f8923c740159052d719dbfc2a2f81942d68dd34fcaf61c706a02c9b80feeef8e
