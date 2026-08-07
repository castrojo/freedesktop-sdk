# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

description: |
  Generate the EFI authenticated update files (PK.auth, KEK.auth, DB.auth)
  used to enroll the secure boot keys, using sbsiglist and sbvarsign from
  sbsigntools. This replaces the removed efitools-efi element.

build-depends:
- components/_private/sbsigntools.bst

depends:
- public-stacks/runtime-gnu.bst
- components/openssl.bst

(?):
- not prod_keys:
    build-depends:
      (>):
      - components/boot-keys-test.bst
- prod_keys:
    build-depends:
      (>):
      - components/boot-keys-prod.bst

variables:
  fdsdk-keys-uuid: 3eaca6a1-86fa-4580-9487-cccae358e9e4
  strip-binaries: ''

config:
  build-commands:
    (<):
    - cp -ra /boot-keys/* .
    (>):
    - |
      set -euxo pipefail
      # Generate base ESL files from the primary certificates
      sbsiglist --owner '%{fdsdk-keys-uuid}' --type x509 --output PK.esl PK.crt
      sbsiglist --owner '%{fdsdk-keys-uuid}' --type x509 --output KEK.esl KEK.crt
      sbsiglist --owner '%{fdsdk-keys-uuid}' --type x509 --output DB.esl DB.crt
      # Merge any extra certificates into the base ESL files
      for type in kek db; do
        for extra in "extra-${type}"/*.crt; do
          [ -f "${extra}" ] || continue
          base="$(dirname "${extra}")$(basename "${extra}" .crt)"
          owner='%{fdsdk-keys-uuid}'
          [ -f "${base}.owner" ] && owner="$(cat "${base}.owner")"
          sbsiglist --owner "${owner}" --type x509 --output "${base}.esl" "${extra}"
          cat "${base}.esl" >> "${type^^}.esl"
        done
      done
    - sbvarsign --key PK.key --cert PK.crt PK PK.esl --output PK.auth
    - sbvarsign --key PK.key --cert PK.crt KEK KEK.esl --output KEK.auth
    - sbvarsign --key KEK.key --cert KEK.crt db DB.esl --output DB.auth
  install-commands:
  - |
    install -Dm644 -t '%{install-root}%{datadir}/efi-keys' {PK,KEK,DB}.auth
  - |
    %{install-extra}
