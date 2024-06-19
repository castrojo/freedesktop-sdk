kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/man-pages-posix.bst

config:
  install-commands:
  - |
    make prefix="%{prefix}" DESTDIR="%{install-root}" install

  - |
    # The following is provided by components/shadow.bst
    rm "%{install-root}%{mandir}/man3/getspnam.3"
    rm "%{install-root}%{mandir}/man5/passwd.5"

sources:
- kind: git_repo
  url: kernel:docs/man-pages/man-pages.git
  track: man-pages-*
  exclude:
  - '*rc*'
  ref: man-pages-6.9.1-0-gefc71944cf19b4b6accc4bb7d0228e0a8c551afa
