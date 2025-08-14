kind: manual

build-depends:
- components/gcc.bst
- components/stripper.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libcap.bst

config:
  build-commands:
  - |
    gcc -fPIC ${CFLAGS} ${LDFLAGS} -Werror -shared fakecap.c -o fakecap.so

  install-commands:
  - |
    install -Dm644 -t '%{install-root}%{libexecdir}/fakecap' fakecap.so

  - |
    %{install-extra}

sources:
- kind: local
  path: files/fakecap
