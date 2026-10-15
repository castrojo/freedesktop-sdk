# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make
description: |
  ## The Freedesktop-SDK Linux kernel

  The kernel is intended for use in the OS images.

  The kernel supports a wide range of desktop usecases.

  To achieve this the kernel has configurations for a wide range of hardware,
  including but not limited to:
  - Virtual machines
  - intel and amd laptops
  - server hardware
  - mobile devices, such as:
    - PinePhone Pro (aarch64)
    - OnePlus 6
  - development boards, such as:
    - Sifive Unmatched(riscv)

  Additionally the kernel has configurations to support
  the standard features you'd expect for desktop usecases:
  - Security features, for example:
    - secure boot
    - module signing
    - Trusted Platform Modules
    - selinux, apparmor landlock
  - A wide range of peripherals, for example:
    - wifi hardware
    - bluetooth hardware
    - USB devices
    - Touchscreens
    - networking
  - KVM support for x86_64 and aarch64

  The kernel is automatically configured appropriately for each `target_arch`.

  To see an up to date list of all features enabled by the kernel configuration
  see: <files/linux/fdsdk-config.sh>.

  ### Maintaining the Kernel Configuration

  The kernel configuration is defined in <files/linux/fdsdk-config.sh>.

  To assist with maintaining a wide range of usecases,
  it is maintained with reference to the common configurations used between
  the Debian and Fedora kernel configurations.

  To maintain the config before major releases of Freedesktop-SDK and when updating this kernel,
  the `kernel-conf-utils/compare.bst` can be used.
  The element outputs a comparison between the fdsdk kernel with common configs in the Debian and Fedora kernels,
  to enable a developer to update the Freedesktop-SDK Kernel config.

  Additionally the config may be adjusted as needed to provide support for additional features.

(@):
- elements/include/linux.yml

build-depends:
- public-stacks/buildsystem-make.bst
- components/bison.bst
- components/cpio.bst  # loongarch64 build enabled CONFIG_IKHEADERS by default
- components/flex.bst
- components/bc.bst
- components/gzip.bst
- components/pahole.bst
- components/python3.bst
- components/rsync.bst
- components/rust.bst
- components/rust-bindgen.bst
- components/rust-src.bst
# The build process uses `hexdump`
- components/util-linux.bst
- components/zstd.bst
- filename: components/linux-module-cert.bst
  strict: True

environment:
  ARCH: '%{kernel_arch}'
  # compile.h has hardcoded timestamp, let's seed it
  KBUILD_BUILD_TIMESTAMP: 'Thu Nov 10 15:00:00 UTC 2011'
  KBUILD_BUILD_USER: 'tomjon'
  MAXJOBS: "%{max-jobs}"
  # arch/x86/Makefile hardcodes -march=x86-64 -mtune=generic, overriding
  # gcc's --with-arch_64 default. KCFLAGS is appended after KBUILD_CFLAGS,
  # so a later -march wins.
  (?):
  - x86_64_v3:
      KCFLAGS: "-march=x86-64-v3 -mtune=skylake"

environment-nocache:
- MAXJOBS

variables:
  bootdir: /boot
  kernel_arch: '%{arch}'
  src-arch: '%{kernel_arch}'
  image-name: '$(make -s image_name)'
  optimize-debug: False
  (?):
  - target_arch == "x86_64":
      src-arch: x86
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch in ("ppc64", "ppc64le"):
      kernel_arch: powerpc
  - target_arch == "riscv64":
      kernel_arch: riscv
  - target_arch == "loongarch64":
      kernel_arch: loongarch

config:
  configure-commands:
  - |
    # Generate the default kernel config for the target architecture
    make defconfig

  - |
    . ./config-utils.sh
    rm -f expected-configs
    . ./fdsdk-config.sh "%{arch}"

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
      x86_64|aarch64)
        [ "${missing_configs}" = 0 ]
      ;;
    esac

  install-commands:
  - |
    release=$(make -s kernelrelease)
    install -Dm644 "%{image-name}" "%{install-root}%{indep-libdir}/modules/${release}/vmlinuz"
    install -Dm644 vmlinux "%{install-root}%{indep-libdir}/modules/${release}/vmlinux"
    install -Dm644 System.map "%{install-root}%{indep-libdir}/modules/${release}/System.map"
    install -Dm644 .config "%{install-root}%{indep-libdir}/modules/${release}/config"
    make -j1 INSTALL_MOD_PATH="%{install-root}%{prefix}" modules_install

  - |
    release=$(make -s kernelrelease)
    targetdir="%{install-root}%{prefix}/src/linux-${release}"

    rm "%{install-root}%{indep-libdir}/modules/${release}"/build

    to_copy=(
      Makefile
      Module.symvers
      .config
      "arch/%{src-arch}/include"
      "arch/%{src-arch}/Makefile"
      scripts
      include
    )
    if [ "$(scripts/config -s OBJTOOL)" = y ]; then
      to_copy+=(tools/objtool/objtool)
    fi
    for file in "${to_copy[@]}"
    do
      targetfile="${targetdir}/${file}"
      dir="$(dirname "${targetfile}")"
      [ -d "${dir}" ] || install -d "${dir}"
      cp -aT "${file}" "${targetfile}"
    done

    ln -sr "${targetdir}" "%{install-root}%{indep-libdir}/modules/${release}/build"

  - |
    %{install-extra}

  (?):
  - target_arch in ["aarch64", "riscv64"]:
      install-commands:
        (>):
        - |
          release=$(make -s kernelrelease)
          make -j1 INSTALL_DTBS_PATH="%{install-root}%{indep-libdir}/modules/${release}/dtbs" dtbs_install

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{indep-libdir}/modules/*/System.map'
      debug:
        (>):
        - '%{indep-libdir}/modules/*/vmlinux'
    overlap-whitelist:
    - "%{project_licensedir}"
    - "%{project_licensedir}/**"

sources:
  # Please do not move the kernel config to linux.yml. Each time we
  # tweak the configuration, we need would need to rebuild:
  # bpf -> systemd -> gtk -> webkitgtk...
  (>):
  - kind: local
    path: files/linux/config-utils.sh
  - kind: local
    path: files/linux/fdsdk-config.sh
