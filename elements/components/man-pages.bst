kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    make prefix="%{prefix}" DESTDIR="%{install-root}" install

  - |
    # The following is provided by components/shadow.bst
    rm "%{install-root}%{mandir}/man3/getspnam.3"
    rm "%{install-root}%{mandir}/man5/passwd.5"
    # The following is provided by bootstrap/libxcrypt.bst
    rm "%{install-root}%{mandir}/man3/crypt.3"
    rm "%{install-root}%{mandir}/man3/crypt_r.3"

sources:
- kind: git_repo
  url: kernel:docs/man-pages/man-pages.git
  track: man-pages-*
  exclude:
  - '*rc*'
  - '*-a*'
  ref: man-pages-6.11-0-gb7deab7aacf9a08355cf13c28ce32ea1572864b1
