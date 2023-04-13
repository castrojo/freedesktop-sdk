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
  ref: man-pages-6.05-a1-0-g254fe38b229dd37f9128fa39d4e8a29d40433388
