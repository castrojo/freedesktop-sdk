kind: stack

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux-full.bst
- components/wireless-regdb-bin.bst
- components/systemd.bst
- components/dbus.bst
- components/dracut.bst
- components/os-release.bst
- components/shadow.bst
- components/tzdata.bst
- components/pkg-config.bst

(?):
- downstream_bsp == "none":
    depends:
      (>):
      - components/linux.bst
      - components/linux-firmware.bst
- downstream_bsp == "spacemit_k1":
    depends:
      (>):
      - components/linux-spacemit-k1.bst
      - components/linux-firmware-spacemit-k1.bst
