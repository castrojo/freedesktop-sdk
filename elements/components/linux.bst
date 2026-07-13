# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make
description: Linux kernel configured for use in virtual machines.

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
  strict: true

variables:
  bootdir: /boot
  kernel_arch: '%{arch}'
  src-arch: '%{kernel_arch}'
  image-name: '$(make -s image_name)'
  optimize-debug: false
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
