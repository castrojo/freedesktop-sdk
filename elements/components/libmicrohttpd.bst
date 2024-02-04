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
  ref: v1.0.0-0-gc4b4657f6180b2083e600b034c6e157a20462fb5
