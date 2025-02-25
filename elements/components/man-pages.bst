kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: man-pages-6.12-0-g0b390e80034f9e134560309840fc4053196523f9
