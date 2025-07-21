kind: make

depends:
- filename: bootstrap-import.bst

# Drop -R when make 4.5 is out

variables:
  make-args: >-
    -R
    prefix="%{prefix}"

config:
  install-commands:
    (>):
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
  ref: man-pages-6.15-0-g9b5bd2e62db076254e05322d30138ea7e38c0e36
