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
  ref: v1.0.2-0-gf2e3bbda41c6263527808187c45f90b1704332f9
