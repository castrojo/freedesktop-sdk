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
- components/iproute2.bst
- vm/base-filesystem.bst
- vm/config/journald.bst
- vm/config/networkd.bst
- vm/config/resolved.bst
- vm/config/useradd-default.bst
- vm/config/systemd-homed-firstboot.bst
- components/usbutils.bst
- components/hosts.bst
- components/bash-config.bst
- components/bash-completion.bst

(?):
- downstream_bsp == "none":
    (?):
    - ("firmware" in minimal_vm):
        depends:
          (>):
          - components/linux-firmware.bst
    depends:
      (>):
      - components/linux.bst
- downstream_bsp == "spacemit_k1":
    (?):
    - ("firmware" in minimal_vm):
        depends:
          (>):
          - components/linux-firmware-spacemit-k1.bst
    depends:
      (>):
      - components/linux-spacemit-k1.bst
