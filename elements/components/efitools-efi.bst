kind: make

(@):
- elements/include/efitools.yml

config:
  build-commands:
    (<):
    - cp -ra /boot-keys/* .
    (>):
    - |
      for type in kek db; do
        regen=0
        for extra in "extra-${type}"/*.crt; do
          if [ -f "${extra}" ]; then
            base="$(dirname "${extra}")$(basename "${extra}" .crt)"
            owner='%{fdsdk-keys-uuid}'
            if [ -f "${base}.owner" ]; then
              owner="$(cat "extra-kek/${base}.owner")"
            fi
            ./cert-to-efi-sig-list -g '${owner}' "${extra}" "${base}.esl"
            case "${type}" in
              kek)
                cat "${base}.esl" >>KEK.esl
                ;;
              db)
                cat "${base}.esl" >>DB.esl
                ;;
            esac
            regen=1
          fi
        done
        if [ "${regen}" = 1 ]; then
          case "${type}" in
            kek)
              ./sign-efi-sig-list -c PK.crt -k PK.key KEK KEK.esl KEK.auth
              ;;
            db)
              ./sign-efi-sig-list -c KEK.crt -k KEK.key db DB.esl DB.auth
              ;;
          esac
        fi
      done

    # Might need some rebuilds
    - |
      %{make}

  install-commands:
    - |
      install -Dm644 -t '%{install-root}%{datadir}/efitools/efi' *.efi

    - |
      install -Dm644 -t '%{install-root}%{datadir}/efitools/efi' {PK,KEK,DB}.auth

    - |
      %{install-extra}
