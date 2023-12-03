kind: autotools

build-depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
- filename: components/gperf.bst

runtime-depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libseccomp.so'

# FIXME: loongarch-specific source is not needed when 2.6.0 is released
(?):
- target_arch != "loongarch64":
    sources:
    - kind: git_repo
      url: github:seccomp/libseccomp.git
      track: v*
      ref: v2.5.5-0-gf0b04ab0b4fc0bc2cde6da1f407b4a487fe6d78f
- target_arch == "loongarch64":
    config:
      configure-commands:
        (<):
        - |
          sed -i 's/0\.0\.0/2.6.0/' configure.ac

    sources:
    - kind: git_repo
      url: github:seccomp/libseccomp.git
      track: main
      ref: v2.2.0-496-gf1c3196d9b95de22dde8f23c5befcbeabef5711c
