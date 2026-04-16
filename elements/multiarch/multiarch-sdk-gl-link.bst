kind: script

build-depends:
- public-stacks/runtime-gnu.bst

(?):
- target_arch == "i686":
    config:
      commands:
      - install -dm755 "%{install-root}%{libdir}"
      - ln -s /app/%{lib}/GL "%{install-root}%{libdir}/GL"
