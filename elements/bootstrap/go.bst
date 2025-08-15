kind: manual

(@):
- elements/bootstrap/include/target.yml
- elements/include/go-source.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/build/binutils-stage1.bst
- bootstrap/build/debug-utils.bst

runtime-depends:
- bootstrap/symlinks.bst

variables:
  optimize-debug: "false"

environment:
  GOARCH: "%{go-arch}"
  GOOS: linux
  CGO_ENABLED: '0'

config:
  build-commands:
  - |
    cd src
    bash make.bash

  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{libdir}/go" VERSION
    install -v -Dm755 -t "%{install-root}%{libdir}/go/bin" \
      $(test -d bin/${GOOS}_${GOARCH} && echo bin/${GOOS}_${GOARCH}/* || echo bin/*)

    mkdir -p "%{install-root}%{libdir}/go/pkg"
    for i in pkg/include pkg/tool; do
      cp -r "${i}" "%{install-root}%{libdir}/go/pkg/"
    done

    for i in api misc src test; do
      cp -r "${i}" "%{install-root}%{libdir}/go/"
    done

  - |
    chmod -x "%{install-root}%{libdir}/go/src/runtime/pprof/testdata"/test*

  - |
    mkdir -p "%{install-root}%{bindir}/"
    for i in "%{install-root}%{libdir}/go/bin"/*; do
      ln -sr "${i}" "%{install-root}%{bindir}/"
    done

  - |
    find "%{install-root}%{libdir}/go/src" -perm -111 -type f -exec chmod 0644 {} ";"

  - |
    rm -vf "%{install-root}%{libdir}/go/src/debug/elf/testdata/libtiffxx.so_"

  - |
    %{install-extra}

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/go/src/**"
        - "%{libdir}/go/src"
