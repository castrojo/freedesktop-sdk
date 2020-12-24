kind: stack
description: |
  Moves all localisation data into a separate root directory, 
  this is so we can use this as a mountpoint for the Locale
  extension, and not ship localisation data in the main SDK

depends:
- bootstrap-import.bst

public:
  bst:
    integration-commands:
    - |
      targetdir="%{datadir}/runtime/locale"
      mkdir -p "${targetdir}"
      movelocale() {
        subdir="$1"
        origpath="$2"
        for langpath in "${origpath}"/*; do
          if [ -d "${langpath}" ]; then
            lang=$(basename "${langpath}" | sed 's/[@\._].*//g')
            case "${lang}" in
              C|en)
                ;;
              *)
                  mkdir -p "${targetdir}/${lang}/${subdir}"
                  mv "${langpath}" "${targetdir}/${lang}/${subdir}/"
                  ln -s "$(realpath --relative-to="${origpath}" "${targetdir}/${lang}/${subdir}/$(basename "${langpath}")")" "${langpath}"
                ;;
            esac
          fi
        done
      }
      movelocale "share" "%{datadir}/locale"
      movelocale "lib" "%{indep-libdir}/locale"
