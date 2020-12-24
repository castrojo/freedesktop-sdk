kind: stack

(?):
- target_arch == "x86_64":
    depends:
    - components/go-stage1-amd64.bst
- target_arch == "i686":
    depends:
    - components/go-stage1-386.bst
- target_arch == "aarch64":
    depends:
    - components/go-stage1-arm64.bst
- target_arch == "arm":
    depends:
    - components/go-stage1-armv6l.bst
- target_arch == "ppc64le":
    depends:
    - components/go-stage1-ppc64le.bst
