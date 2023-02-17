kind: manual

build-depends:
- bootstrap-import.bst
- components/acpica-tools.bst
- components/util-linux.bst
- components/python3.bst
- components/nasm.bst

environment:
  JOBS: "%{max-jobs}"

environment-nocache:
- JOBS

variables:
  build-args: >-
    -n "${JOBS}"
    --buildtarget=RELEASE
    --tagname=GCC5
    --platform='%{platform}'
    %{arch-args}
    %{opts}

  opts: >-
    -D TPM1_ENABLE
    -D TPM2_ENABLE
    -D TPM2_CONFIG_ENABLE
    -D SECURE_BOOT_ENABLE
    %{arch-opts}

  code: '%{build-dir}/FV/OVMF_CODE.fd'
  vars: '%{build-dir}/FV/OVMF_VARS.fd'

  (?):
  - target_arch == "x86_64":
      arch-args: >-
        --arch=IA32
        --arch=X64
      arch-opts: >-
        -D SMM_REQUIRE
      platform: OvmfPkg/OvmfPkgIa32X64.dsc
      build-dir: Build/Ovmf3264/RELEASE_GCC5
      shell: '%{build-dir}/X64/Shell.efi'

  - target_arch == "aarch64":
      arch-args: >-
        --arch=AARCH64
      arch-opts: ''
      platform: ArmVirtPkg/ArmVirtQemu.dsc
      build-dir: Build/ArmVirtQemu-AARCH64/RELEASE_GCC5
      code: '%{build-dir}/FV/QEMU_EFI.fd'
      vars: '%{build-dir}/FV/QEMU_VARS.fd'
      shell: '%{build-dir}/AARCH64/Shell.efi'

config:
  build-commands:
  - |
    . ./edksetup.sh
    make -C BaseTools/Source/C -j${JOBS}
    build %{build-args}

  install-commands:
  - |
    if [ "%{target_arch}" = "aarch64" ]; then
       truncate --size=64M '%{code}' '%{vars}'
    fi

  - |
    install -Dm644 -t "%{install-root}%{datadir}/ovmf" '%{code}' '%{vars}' '%{shell}'

sources:
- kind: git_tag
  url: github:tianocore/edk2.git
  track: master
  match:
  - edk2-stable*
  ref: edk2-stable202211-0-gfff6d81270b57ee786ea18ad74f43149b9f03494
- kind: git_module
  path: CryptoPkg/Library/OpensslLib/openssl
  url: github:openssl/openssl.git
  ref: d82e959e621a3d597f1e0d50ff8c2d8b96915fd7
- kind: git_module
  path: ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3
  url: github:ucb-bar/berkeley-softfloat-3.git
  ref: b64af41c3276f97f0e181920400ee056b9c88037
- kind: git_module
  path: UnitTestFrameworkPkg/Library/CmockaLib/cmocka
  url: github:tianocore/edk2-cmocka.git
  ref: 1cc9cde3448cdd2e000886a26acf1caac2db7cf1
- kind: git_module
  path: MdeModulePkg/Universal/RegularExpressionDxe/oniguruma
  url: github:kkos/oniguruma.git
  ref: abfc8ff81df4067f309032467785e06975678f0d
- kind: git_module
  path: MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  url: github:google/brotli.git
  ref: f4153a09f87cbb9c826d8fc12c74642bb2d879ea
- kind: git_module
  path: BaseTools/Source/C/BrotliCompress/brotli
  url: github:google/brotli.git
  ref: f4153a09f87cbb9c826d8fc12c74642bb2d879ea
- kind: git_module
  path: RedfishPkg/Library/JsonLib/jansson
  url: github:akheron/jansson.git
  ref: e9ebfa7e77a6bee77df44e096b100e7131044059
