kind: make

build-depends:
- components/_private/git-minimal.bst
- components/go-md2man.bst
- components/go.bst
- public-stacks/buildsystem-make.bst

variables:
  optimize-debug: "false"
  strip-binaries: ''
  command-subdir: common
  make-args: >-
    PREFIX="%{prefix}"
    docs

config:
  install-commands:
    (>):
    - install -Dm644 ../image/default-policy.json "%{install-root}%{sysconfdir}/containers/policy.json"
    - install -Dm644 ../image/default.yaml "%{install-root}%{sysconfdir}/containers/registries.d/default.yaml"
    - install -Dm644 ../image/registries.conf "%{install-root}%{sysconfdir}/containers/registries.conf"
    - install -Dm644 ../shortnames/shortnames.conf "%{install-root}%{sysconfdir}/containers/registries.conf.d/000-shortnames.conf"

    - install -Dm644 ../storage/storage.conf "%{install-root}%{datadir}/containers/storage.conf"
    - install -Dm644 pkg/config/containers.conf "%{install-root}%{datadir}/containers/containers.conf"
    - install -Dm644 pkg/seccomp/seccomp.json "%{install-root}%{datadir}/containers/seccomp.json"
    - install -Dm644 pkg/subscriptions/mounts.conf "%{install-root}%{datadir}/containers/mounts.conf"

sources:
- kind: git_repo
  url: github:podman-container-tools/container-libs.git
  track: common/v*
  ref: common/v0.68.0-0-gbb6a37c8946a977f24a8eed4d97b2dc3608cd05e
- kind: git_repo
  url: github:containers/shortnames.git
  directory: shortnames
  track: v*
  ref: v2025.03.19-0-g4b8136e465e6b1e866a3cac8fdc3a7ff91d183d8
