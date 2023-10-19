kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/groff.bst

depends:
- bootstrap-import.bst

config:
  install-commands:
    (>):
    - |
      rmdir '%{install-root}/var/run'
      rmdir '%{install-root}/var'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblber.so'
        - '%{libdir}/libldap.so'
      # openldap runtime is here only because it is needed by gnupg, let's keep only libraries.
      vm-only:
        - '%{sysconfdir}'
        - '%{sysconfdir}/**'
        - '%{bindir}'
        - '%{bindir}/**'
        - '%{libexecdir}'
        - '%{libexecdir}/**'

sources:
- kind: tar
  url: tar_https:www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.6.tgz
  ref: 082e998cf542984d43634442dbe11da860759e510907152ea579bdc42fe39ea0
