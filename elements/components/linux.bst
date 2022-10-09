kind: make
description: Linux kernel configured for use in virtual machines.

depends:
- components/kmod.bst

build-depends:
- bootstrap-import.bst
- components/bison.bst
- components/flex.bst
- components/bc.bst
- components/gzip.bst
- components/rsync.bst

variables:
  bootdir: /boot
  kernel_arch: '%{arch}'
  src-arch: '%{kernel_arch}'
  image-name: '$(make -s image_name)'
  (?):
  - target_arch == "x86_64":
      src-arch: x86
  - target_arch == "aarch64":
      kernel_arch: arm64
      # The default image file is not EFI compatible
      image-name: arch/arm64/boot/Image
  - target_arch == "i686":
      src-arch: x86
      kernel_arch: i386
  - target_arch == "ppc64le":
      kernel_arch: powerpc
  - target_arch == "riscv64":
      kernel_arch: riscv
      image-name: arch/riscv/boot/Image

environment:
  ARCH: '%{kernel_arch}'
  # compile.h has hardcoded timestamp, let's seed it
  KBUILD_BUILD_TIMESTAMP: 'Thu Nov 10 15:00:00 UTC 2011'
  KBUILD_BUILD_USER: 'tomjon'

config:
  configure-commands:
  - |
    # Generate the default kernel config for the target architecture
    make defconfig

  - |
    . ./config-utils.sh
    rm -f expected-configs

    # Modify the kernel config for additional features

    # Kernel Config Options
    enable DEVTMPFS
    enable CGROUPS
    enable INOTIFY_USER
    enable SIGNALFD
    enable TIMERFD
    enable EPOLL
    enable NET
    enable SYSFS
    enable PROC_FS
    enable FHANDLE

    # Enable access to kernel config through /proc/config.gz
    enable IKCONFIG
    enable IKCONFIG_PROC

    # Kernel crypto/hash API
    module CRYPTO_AES
    module CRYPTO_ARC4
    module CRYPTO_CBC
    module CRYPTO_CMAC
    module CRYPTO_CRC32
    module CRYPTO_CRC32C
    module CRYPTO_CRCT10DIF
    module CRYPTO_DES
    module CRYPTO_ECB
    module CRYPTO_GHASH
    module CRYPTO_HMAC
    module CRYPTO_MD4
    module CRYPTO_MD5
    module CRYPTO_SHA1
    module CRYPTO_SHA256
    module CRYPTO_SHA512
    module CRYPTO_XTS

    enable CRYPTO_USER_API_HASH
    enable CRYPTO_USER_API_SKCIPHER

    case "%{arch}" in
      i686)
        module CRYPTO_CRC32C_INTEL
        module CRYPTO_CRC32_PCLMUL
        module CRYPTO_AES_NI_INTEL
        ;;
      x86_64)
        module CRYPTO_CRC32C_INTEL
        module CRYPTO_CRC32_PCLMUL
        module CRYPTO_AES_NI_INTEL
        module CRYPTO_CRCT10DIF_PCLMUL
        module CRYPTO_GHASH_CLMUL_NI_INTEL
        module CRYPTO_SHA1_SSSE3
        module CRYPTO_SHA256_SSSE3
        module CRYPTO_SHA512_SSSE3
        module CRYPTO_DES3_EDE_X86_64
        ;;
      arm)
        module CRYPTO_SHA1_ARM
        module CRYPTO_SHA1_ARM_NEON
        module CRYPTO_SHA1_ARM_CE
        module CRYPTO_SHA2_ARM_CE
        module CRYPTO_SHA256_ARM
        module CRYPTO_SHA512_ARM
        module CRYPTO_AES_ARM
        module CRYPTO_AES_ARM_BS
        module CRYPTO_AES_ARM_CE
        module CRYPTO_GHASH_ARM_CE
        module CRYPTO_CRCT10DIF_ARM_CE
        module CRYPTO_CRC32_ARM_CE
        ;;
      aarch64)
        module CRYPTO_SHA256_ARM64
        module CRYPTO_SHA512_ARM64
        module CRYPTO_SHA1_ARM64_CE
        module CRYPTO_SHA2_ARM64_CE
        module CRYPTO_SHA512_ARM64_CE
        module CRYPTO_GHASH_ARM64_CE
        module CRYPTO_CRCT10DIF_ARM64_CE
        module CRYPTO_AES_ARM64
        module CRYPTO_AES_ARM64_CE
        module CRYPTO_AES_ARM64_CE_CCM
        module CRYPTO_AES_ARM64_CE_BLK
        module CRYPTO_AES_ARM64_NEON_BLK
        module CRYPTO_AES_ARM64_BS
        ;;
    esac

    case "%{arch}" in
    esac

    # udev will fail to work with legacy sysfs
    remove SYSFS_DEPRECATED

    # Boot is very slow with systemd when legacy PTYs are present
    remove LEGACY_PTYS
    remove LEGACY_PTY_COUNT

    # Legacy hotplug confuses udev
    value_str UEVENT_HELPER_PATH ""

    # Userspace firmware loading not supported
    remove FW_LOADER_USER_HELPER

    # Some udev/virtualization requires
    enable DMIID

    # Support for some SCSI devices serial number retrieval
    enable BLK_DEV_BSG

    # Required for PrivateNetwork= in service units
    enable NET_NS
    enable USER_NS

    # Required for 9p support
    enable NET_9P
    enable NET_9P_VIRTIO
    enable 9P_FS
    enable 9P_FS_POSIX_ACL
    enable 9P_FS_SECURITY
    enable VIRTIO_PCI

    # Strongly Recommended
    enable IPV6
    enable AUTOFS4_FS
    enable TMPFS_XATTR
    enable TMPFS_POSIX_ACL
    enable EXT4_FS_POSIX_ACL
    enable EXT4_FS_SECURITY
    enable SECCOMP
    enable SECCOMP_FILTER
    enable CHECKPOINT_RESTORE

    # Required for CPUShares= in resource control unit settings
    enable CGROUP_SCHED
    enable FAIR_GROUP_SCHED

    # Required for CPUQuota= in resource control unit settings
    enable CFS_BANDWIDTH

    # Required for IPAddressDeny=, IPAddressAllow= in resource control unit settings
    enable CGROUP_BPF

    # For UEFI systems
    enable EFIVAR_FS
    enable EFI_PARTITION
    enable EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER

    # RT group scheduling (effectively) makes RT scheduling unavailable for userspace
    remove RT_GROUP_SCHED

    # Required for 3D acceleration in virtual machines
    enable DRM_VIRTIO_GPU
    module DRM_VMWGFX

    # Sound with QEMU
    module SOUND
    module SND
    enable SND_HDA_GENERIC

    # Required for live boot
    module SQUASHFS
    enable SQUASHFS_ZLIB
    module OVERLAY_FS

    # Required by snapd
    enable SQUASHFS_XZ
    enable SQUASHFS_LZO

    # Some useful drivers when running as virtual machine
    module VIRTIO_BALLOON
    module VIRTIO_INPUT
    module LIBNVDIMM
    enable VIRTIO_PMEM
    enable VIRTIO_NET
    enable VIRTIO_BLK
    enable SCSI_VIRTIO
    enable VIRTIO_IOMMU

    enable BLK_MQ_VIRTIO
    module VIRTIO_CONSOLE
    enable HW_RANDOM_VIRTIO
    module VIRTIO_MMIO
    module CRYPTO_DEV_VIRTIO

    # Input
    enable INPUT_EVDEV
    enable INPUT_TOUCHSCREEN
    enable INPUT_TABLET

    # needed by spice-vdagent
    module VSOCKETS
    module VIRTIO_VSOCKETS
    module INPUT_UINPUT

    # for virtualbox
    case "%{arch}" in
      i686|x86_64)
        enable VIRT_DRIVERS
        module VBOXGUEST
      ;;
    esac

    # For wireless networks
    enable WIRELESS
    module CFG80211
    enable CFG80211_WEXT
    enable MAC80211
    enable NETDEVICES
    enable WLAN

    # Wifi hardware
    module IWLWIFI
    module IWLMVM
    module IWLDVM
    module ATH9K
    module ATH10K
    module ATH10K_PCI
    module RTW88
    enable RTW88_8822BE
    enable RTW88_8822CE
    enable WLAN_VENDOR_ATH

    # Ethernet hardware
    module IGB

    # Common DRM drivers
    module DRM_NOUVEAU
    module DRM_RADEON
    module DRM_AMDGPU
    enable DRM_AMDGPU_SI
    enable DRM_AMDGPU_CIK
    enable DRM_AMD_DC
    case "%{arch}" in
      x86_64|i686)
        enable DRM_AMD_DC_DCN
      ;;
    esac
    enable DRM_AMD_DC_HDCP
    enable DRM_AMD_DC_SI
    enable DRM_RADEON_USERPTR
    enable DRM_AMDGPU_USERPTR
    enable DRM_AMD_ACP
    module SND_SOC
    module SND_SOC_AMD_ACP
    case "%{arch}" in
      x86_64|i686)
        module DRM_I915
        module DRM_GMA500
        ;;
      aarch64|arm)
        ;;
    esac

    # FUSE
    module FUSE_FS
    module CUSE

    # iSCSI
    enable SCSI_LOWLEVEL
    module ISCSI_TCP
    module SCSI_ISCSI_ATTRS

    # Device mapper
    module DM_CRYPT
    module DM_INTEGRITY
    enable DM_UEVENT
    module DM_RAID
    module DM_SNAPSHOT
    module DM_VERITY

    # USB audio
    module SND_USB_AUDIO

    # Common USB webcams
    enable MEDIA_SUPPORT
    enable MEDIA_USB_SUPPORT
    enable MEDIA_CAMERA_SUPPORT
    module USB_VIDEO_CLASS
    module USB_GSPCA
    module USB_GSPCA_BENQ
    module USB_GSPCA_CONEX
    module USB_GSPCA_CPIA1
    module USB_GSPCA_DTCS033
    module USB_GSPCA_ETOMS
    module USB_GSPCA_FINEPIX
    module USB_GSPCA_JEILINJ
    module USB_GSPCA_JL2005BCD
    module USB_GSPCA_KINECT
    module USB_GSPCA_KONICA
    module USB_GSPCA_MARS
    module USB_GSPCA_MR97310A
    module USB_GSPCA_NW80X
    module USB_GSPCA_OV519
    module USB_GSPCA_OV534
    module USB_GSPCA_OV534_9
    module USB_GSPCA_PAC207
    module USB_GSPCA_PAC7302
    module USB_GSPCA_PAC7311
    module USB_GSPCA_SE401
    module USB_GSPCA_SN9C2028
    module USB_GSPCA_SN9C20X
    module USB_GSPCA_SONIXB
    module USB_GSPCA_SONIXJ
    module USB_GSPCA_SPCA500
    module USB_GSPCA_SPCA501
    module USB_GSPCA_SPCA505
    module USB_GSPCA_SPCA506
    module USB_GSPCA_SPCA508
    module USB_GSPCA_SPCA561
    module USB_GSPCA_SPCA1528
    module USB_GSPCA_SQ905
    module USB_GSPCA_SQ905C
    module USB_GSPCA_SQ930X
    module USB_GSPCA_STK014
    module USB_GSPCA_STK1135
    module USB_GSPCA_STV0680
    module USB_GSPCA_SUNPLUS
    module USB_GSPCA_T613
    module USB_GSPCA_TOPRO
    module USB_GSPCA_TOUPTEK
    module USB_GSPCA_TV8532
    module USB_GSPCA_VC032X
    module USB_GSPCA_VICAM
    module USB_GSPCA_XIRLINK_CIT
    module USB_GSPCA_ZC3XX

    # NVME disks
    module BLK_DEV_NVME
    enable NVME_HWMON

    # Memory card readers
    module MISC_RTSX_PCI
    module MMC
    module MMC_BLOCK
    module MMC_REALTEK_PCI

    # Bluetooth
    enable BT
    module BT_HCIBTUSB
    module BT_HIDP
    module UHID

    # Sound for HDA
    module SND_HDA_INTEL
    enable SND_HDA_RECONFIG
    enable SND_HDA_INPUT_BEEP
    enable SND_HDA_PATCH_LOADER
    module SND_HDA_CODEC_REALTEK
    module SND_HDA_CODEC_ANALOG
    module SND_HDA_CODEC_SIGMATEL
    module SND_HDA_CODEC_VIA
    module SND_HDA_CODEC_HDMI
    module SND_HDA_CODEC_CIRRUS
    module SND_HDA_CODEC_CONEXANT
    module SND_HDA_CODEC_CA0110
    module SND_HDA_CODEC_CA0132
    enable SND_HDA_CODEC_CA0132_DSP
    module SND_HDA_CODEC_CMEDIA
    module SND_HDA_CODEC_SI3054

    # HID drivers
    module HID_MULTITOUCH
    module HID_GENERIC
    if has ACPI && has I2C; then
      module I2C_HID_ACPI
    fi
    enable HIDRAW

    # CPU support
    enable PINCTRL
    case "%{arch}" in
      x86_64|i686)
        # pinctrl_amd might not work as module if it is loaded to late
        enable PINCTRL_AMD
        enable AMD_IOMMU_V2
        enable X86_AMD_PLATFORM_DEVICE
        ;;
    esac

    # I2C/SMBus
    case "%{arch}" in
      x86_64|i686)
        module I2C_PIIX4
        module I2C_DESIGNWARE_PLATFORM
        module MFD_INTEL_LPSS_PCI
        module MFD_INTEL_LPSS_ACPI
      ;;
    esac

    # USB Network interfaces
    module USB_NET_DRIVERS
    module USB_USBNET
    module USB_NET_CDCETHER
    module USB_NET_CDC_SUBSET
    module USB_NET_RNDIS_HOST
    module USB_RTL8150
    module USB_RTL8152

    # USB Serial
    enable USB_SERIAL
    module USB_SERIAL_SIMPLE
    module USB_SERIAL_FTDI_SIO
    module USB_SERIAL_CH341
    module USB_ACM

    # Required by podman
    module TUN
    enable CGROUP_HUGETLB
    enable CGROUP_PIDS
    enable CPUSETS
    enable MEMCG
    enable CGROUP_SCHED
    enable BLK_CGROUP

    # KVM
    case "%{arch}" in
      x86_64|i686)
        module KVM
        module KVM_INTEL
        module KVM_AMD
        ;;
      aarch64)
        module KVM
        ;;
    esac

    # Useful filesystems
    for fs in XFS BTRFS EXFAT VFAT F2FS ISO9660 UDF NTFS3; do
      module "${fs}_FS"
    done
    for fs in BTRFS F2FS; do
      enable "${fs}_FS_POSIX_ACL"
    done
    enable "XFS_POSIX_ACL"
    enable FS_ENCRYPTION

    # Needed for FAT filesystems
    enable NLS_CODEPAGE_437
    enable NLS_ISO8859_1

    # Power managment
    enable PM

    # RAM error correction
    if has HAS_IOMEM && has EDAC_SUPPORT; then
      enable RAS
      module EDAC
    fi

    # PCI
    if has HAVE_PCI; then
      enable PCI_IOV
      enable PCI_PRI
      enable PCI_PASID
      enable HOTPLUG_PCI
      enable HOTPLUG_PCI_PCIE
      enable PCIEPORTBUS
      #enable PCIE_PME
      enable PCIE_PTM
      if has RAS; then
        enable PCIEAER
        module PCIEAER_INJECT
        enable PCIE_ECRC
        enable PCIE_DPC
        if has ACPI; then
          enable PCIE_EDR
        fi
      fi
    fi

    # RISC-V
    case "%{arch}" in
      riscv*)
        # QEMU
        enable SOC_VIRT

        # Sifive Unmatched
        enable SOC_SIFIVE
        enable SIFIVE_L2
        enable PCIE_FU740
        enable PCIE_MICROSEMI
        enable PCI_SW_SWITCHTEC
        enable PWM
        module PWM_SIFIVE
        enable COMMON_CLK_PWM
        enable EDAC_SIFIVE
        ;;
    esac

    # Initramfs
    enable DEVTMPFS
    enable BLK_DEV_INITRD
        for comp in GZIP BZIP2 LZMA XZ LZO LZ4 ZSTD; do
      enable RD_${comp}
    done
    remove DEBUG_BLOCK_EXT_DEVT

    # Compressed firmware
    enable FW_LOADER_COMPRESS

    # Joysticks
    enable INPUT_JOYSTICK
    # Joydev API
    module INPUT_JOYDEV

    # Joysticks (Xbox)
    module JOYSTICK_XPAD
    enable JOYSTICK_XPAD_FF
    enable JOYSTICK_XPAD_LEDS

    # Logitech game controllers
    module HID_LOGITECH
    module HID_LOGITECH_DJ
    module HID_LOGITECH_HIDPP
    enable LOGITECH_FF
    enable LOGIRUMBLEPAD2_FF
    enable LOGIG940_FF
    enable LOGIWHEELS_FF

    # Steam controller
    module HID_STEAM

    # Make sure to enable virtual terminals in DRM
    enable FB
    enable FB_EFI
    enable DRM_FBDEV_EMULATION
    enable FRAMEBUFFER_CONSOLE

    # Network
    module BRIDGE
    module IP_NF_RAW
    module IP6_NF_RAW
    module IP6_NF_NAT
    enable NETFILTER_ADVANCED
    module VETH
    module BLK_DEV_NBD

    # Those two modules are required by multipass
    module NETFILTER_XT_MATCH_COMMENT
    module NETFILTER_XT_TARGET_CHECKSUM

    # Security modules
    enable SECURITY_SELINUX
    enable SECURITY_APPARMOR

    # SPI
    if has HAS_IOMEM; then
      enable SPI
    fi

    # TPM
    module TCG_TPM
    module TCG_CRB
    module TCG_TIS
    if has SPI; then
      module TCG_TIS_SPI
    fi

    # BPF
    enable BPF_SYSCALL
    enable CGROUP_BPF
    if has HAVE_CBPF_JIT || has HAVE_EBPF_JIT; then
      enable BPF_JIT
    fi

    # Secure boot
    enable SYSTEM_BLACKLIST_KEYRING
    enable INTEGRITY_PLATFORM_KEYRING
    enable INTEGRITY_SIGNATURE
    enable INTEGRITY_ASYMMETRIC_KEYS

    # systemd-oom
    enable PSI

    # Hardware monitors
    case "%{arch}" in
      x86_64|i686)
        module SENSORS_K8TEMP
        module SENSORS_K10TEMP
        module SENSORS_FAM15H_POWER
        module SENSORS_NCT6683
        module SENSORS_NCT6775
        module SENSORS_NCT7802
        module SENSORS_NCT7904
        module SENSORS_NCT7904
      ;;
    esac

  - |
    make -j1 olddefconfig

  - |
    . ./config-utils.sh

    missing_configs=0
    for config in $(cat expected-configs); do
      if ! has "${config}"; then
        echo "Missing ${config}" 1>&2
        missing_configs=1
      fi
    done
    # Only fail for...
    case "%{arch}" in
      x86_64|i686|aarch64)
        [ "${missing_configs}" = 0 ]
      ;;
    esac

  install-commands:
  - |
    install -Dm644 "%{image-name}" '%{install-root}%{bootdir}/vmlinuz'
    install -Dm644 System.map '%{install-root}%{bootdir}/System.map'
    install -Dm644 .config '%{install-root}%{bootdir}/config'
    make -j1 INSTALL_MOD_PATH='%{install-root}%{prefix}' modules_install

  - |
    release=$(make -s kernelrelease)
    targetdir="%{install-root}%{prefix}/src/linux-${release}"

    rm "%{install-root}%{indep-libdir}/modules/${release}"/{source,build}

    to_copy=(
      Makefile
      Module.symvers
      .config
      "arch/%{src-arch}/include"
      "arch/%{src-arch}/Makefile"
      scripts
      include
    )
    if [ "$(scripts/config -s STACK_VALIDATION)" = y ]; then
      to_copy+=(tools/objtool/objtool)
    fi
    for file in "${to_copy[@]}"
    do
      targetfile="${targetdir}/${file}"
      dir="$(dirname "${targetfile}")"
      [ -d "${dir}" ] || install -d "${dir}"
      cp -aT "${file}" "${targetfile}"
    done

    ln -sr "${targetdir}" "%{install-root}%{indep-libdir}/modules/${release}/source"
    ln -sr "${targetdir}" "%{install-root}%{indep-libdir}/modules/${release}/build"

  (?):
  - target_arch in ["aarch64", "arm", "riscv64"]:
      install-commands:
        (>):
        - |
          make -j1 INSTALL_DTBS_PATH='%{install-root}%{bootdir}/dtbs' dtbs_install

public:
  bst:
    integration-commands:
    - |
      cd '%{indep-libdir}/modules'
      for version in *; do
        depmod -b '%{prefix}' -a "$version";
      done

    split-rules:
      devel:
        (>):
        - '%{bootdir}/System.map'

(@):
- elements/include/linux.yml
