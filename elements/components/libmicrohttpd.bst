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
- kind: git_tag
  url: git_https:git.gnunet.org/libmicrohttpd.git
  track: master
  exclude:
  - v0.9.71
  ref: v1.0.1-0-g3aee48fd77329ab37091a60602aa50d2fdee964a
