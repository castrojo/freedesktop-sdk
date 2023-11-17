kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libxml2.bst
- components/python3.bst

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/libxslt"
      mv "%{install-root}%{includedir}/libxslt/xsltconfig.h" "%{install-root}%{includedir}/%{gcc_triplet}/libxslt/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/xslt-config'
        - '%{libdir}/libxslt.so'
        - '%{libdir}/libexslt.so'
        - '%{libdir}/xsltConf.sh'
  cpe:
    ignored:
    - CVE-2022-29824

sources:
- kind: git_repo
  url: gnome:libxslt.git
  track: v*
  ref: v1.1.39-0-g743ab691bed98ed11ac99bbd9d903d59fb814ab8
