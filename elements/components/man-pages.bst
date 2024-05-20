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
  ref: man-pages-6.8-0-g50b65afc74b33aba6683585553471881e01fd7d6
