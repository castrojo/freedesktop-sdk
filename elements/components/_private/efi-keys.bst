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
  - cp -ra /boot-keys/* .
  - openssl x509 -inform pem -outform der -in PK.crt -out PK.der
  - openssl x509 -inform pem -outform der -in KEK.crt -out KEK.der
  - openssl x509 -inform pem -outform der -in DB.crt -out DB.der
  - sbsiglist --owner '%{fdsdk-keys-uuid}' --type x509 --output PK.esl PK.der
  - sbsiglist --owner '%{fdsdk-keys-uuid}' --type x509 --output KEK.esl KEK.der
  - sbsiglist --owner '%{fdsdk-keys-uuid}' --type x509 --output DB.esl DB.der
  - |
    for type in kek db; do
      for extra in "extra-${type}"/*.crt; do
        if [ -f "${extra}" ]; then
          base="$(dirname "${extra}")$(basename "${extra}" .crt)"
          openssl x509 -inform pem -outform der -in "${extra}" -out "${base}.der"
        fi
      done
    done
  - |
    for type in kek db; do
      for extra in "extra-${type}"/*.der; do
        if [ -f "${extra}" ]; then
          base="$(dirname "${extra}")$(basename "${extra}" .der)"
          owner='%{fdsdk-keys-uuid}'
          if [ -f "${base}.owner" ]; then
            owner="$(cat "${base}.owner")"
          fi
          sbsiglist --owner "${owner}" --type x509 "${extra}" --output "${base}.esl"
          case "${type}" in
            kek)
              cat "${base}.esl" >>KEK.esl
              ;;
            db)
              cat "${base}.esl" >>DB.esl
              ;;
          esac
        fi
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
