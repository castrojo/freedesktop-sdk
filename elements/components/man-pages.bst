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
- kind: git_tag
  url: kernel:docs/man-pages/man-pages.git
  track: master
  exclude:
  - '*rc*'
  ref: man-pages-6.7-0-g557f96fb1938cc82a543ae5af1dec920c282cf1e
