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
  ref: v0.9.76-0-g4a51f653a223613c3962bf7f0916adcf4146ddc4
