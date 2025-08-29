kind: manual

description: |
  This element should be consumed through ovmf-maybe.bst
  as this is specific to select arches. Certain variables are set to
  a stub value to enable tracking

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
  arch-args: "none"
  arch-opts: "none"
  platform: "none"
  build-dir: "none"
  shell: "none"

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
    if [ "%{platform}" == "none" ]; then
      echo "Unsupported arch, use ovmf-maybe"
      exit 1
    fi

  - |
    rm -rfv "%{build-root}/%{build-dir}"
    mkdir -p "%{build-root}/%{build-dir}"
    cp -vf StackCookieValues*.json "%{build-root}/%{build-dir}"

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

  - |
    %{install-extra}

sources:
- kind: git_repo
  url: github:tianocore/edk2.git
  track: edk2-stable*
  ref: edk2-stable202508-0-gd46aa46c8361194521391aa581593e556c707c6e
- kind: git_module
  path: CryptoPkg/Library/OpensslLib/openssl
  url: github:openssl/openssl.git
  ref: aea7aaf2abb04789f5868cbabec406ea43aa84bf
- kind: git_module
  path: CryptoPkg/Library/MbedTlsLib/mbedtls
  url: github:Mbed-TLS/mbedtls.git
  ref: 8c89224991adff88d53cd380f42a2baa36f91454
- kind: git_module
  path: SecurityPkg/DeviceSecurity/SpdmLib/libspdm
  url: github:DMTF/libspdm.git
  ref: 98ef964e1e9a0c39c7efb67143d3a13a819432e0
- kind: git_module
  path: UnitTestFrameworkPkg/Library/CmockaLib/cmocka
  url: github:tianocore/edk2-cmocka.git
  ref: 1cc9cde3448cdd2e000886a26acf1caac2db7cf1
- kind: git_module
  path: MdeModulePkg/Universal/RegularExpressionDxe/oniguruma
  url: github:kkos/oniguruma.git
  ref: 4ef89209a239c1aea328cf13c05a2807e5c146d1
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
- kind: git_module
  path: UnitTestFrameworkPkg/Library/GoogleTestLib/googletest
  url: github:google/googletest.git
  ref: 86add13493e5c881d7e4ba77fb91c1f57752b3a4
- kind: git_module
  path: UnitTestFrameworkPkg/Library/SubhookLib/subhook
  url: github:tianocore/edk2-subhook.git
  ref: 83d4e1ebef3588fae48b69a7352cc21801cb70bc
- kind: git_module
  path: MdePkg/Library/BaseFdtLib/libfdt
  url: github:devicetree-org/pylibfdt.git
  ref: cfff805481bdea27f900c32698171286542b8d3c
- kind: git_module
  path: MdePkg/Library/MipiSysTLib/mipisyst
  url: github:MIPI-Alliance/public-mipi-sys-t.git
  ref: 370b5944c046bab043dd8b133727b2135af7747a
- kind: local
  path: files/ovmf
