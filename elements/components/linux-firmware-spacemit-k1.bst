kind: manual

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''
  board: "none"
  (?):
  - target_arch == "riscv64":
      board: k1

config:
  install-commands:
  - |
    if [ "%{board}" == "none" ]; then
      echo "Unsupported arch, use linux-firwmare-spacemit-k1-maybe"
      exit 1
    fi
  - |
    mkdir -p "%{install-root}%{indep-libdir}/firmware/"
    cp -rT "board/spacemit/%{board}/target_overlay/lib/firmware" "%{install-root}%{indep-libdir}/firmware"

sources:
- kind: git_repo
  url: git_https:gitee.com/bianbu-linux/buildroot-ext.git
  track: bl-v2.0.y
  ref: 570908e7adca7a59228c6ebecb6d1470de083619
