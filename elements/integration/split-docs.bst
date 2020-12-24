kind: stack
description: |
  Moves documentation into a separate documentation root,
  this is so we can use that directory as a mountpoint for
  the Docs extension of the SDK, and not ship the docs in the
  actual SDK

depends:
- bootstrap-import.bst

public:
  bst:
    integration-commands:
    - |
      move_doc() {
        if [ -d "%{datadir}/${1}" ]; then
          if [ -e "%{datadir}/runtime/docs/${2}" ]; then
            echo "%{datadir}/runtime/docs/${2} already exists" 1>&2
            exit 1
          fi
          mkdir -p "%{datadir}/runtime/docs/$(dirname "${2}")"
          mv "%{datadir}/${1}" "%{datadir}/runtime/docs/${2}"
          ln -s --relative "%{datadir}/runtime/docs/${2}" "%{datadir}/${1}"
        fi
      }
      move_doc man man
      move_doc doc doc
      move_doc examples examples
      move_doc info info
      move_doc help help
      move_doc gtk-doc/html gtk-doc/html
      move_doc ri ri
      for cmakedir in "%{datadir}"/cmake-*; do
        basename="$(basename "${cmakedir}")"
        move_doc "${basename}/Help" "${basename}"
      done
