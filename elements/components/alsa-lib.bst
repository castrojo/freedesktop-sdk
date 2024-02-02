kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/python3.bst
  type: build

variables:
  conf-local: >-
    --disable-aload
    --disable-alisp
    --disable-old-symbols
    --with-pythonlibs="-lpthread -lm -ldl -lpython3"
    --with-pythonincludes=-I/usr/include/python3
    --with-pcm-plugins=all

  local-config-replacement: |
    {
      @func concat
      strings [
        {
          @func getenv
          vars [ XDG_CONFIG_HOME ]
          default "~/.config"
        }
        "/asound.conf"
      ]
    }

config:
  install-commands:
    (>):
    - |
      cat >local-config-replacement <<\EOF
      %{local-config-replacement}
      EOF
      sed '\|"~/.asoundrc"|{
        x
        r local-config-replacement
      }' \
        "%{install-root}%{datadir}/alsa/alsa.conf" \
        >"%{install-root}%{datadir}/alsa/alsa-flatpak.conf"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libasound.so'
        - '%{libdir}/libatopology.so'

sources:
- kind: git_repo
  url: github:alsa-project/alsa-lib.git
  track: v*.*.*
  ref: v1.2.11-0-g7e3a3c2b0a092d0f568ba3c98365030dd91cc877
- kind: patch_queue
  path: patches/alsa-lib
