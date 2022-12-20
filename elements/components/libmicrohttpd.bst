kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_repo
  url: git_https:git.gnunet.org/libmicrohttpd.git
  track: v*
  ref: v0.9.75-0-g940041ad78b4fb8d0f04066046a65bbe3c390fd4
