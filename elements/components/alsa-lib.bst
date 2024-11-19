kind: autotools

depends:
- public-stacks/runtime-minimal.bst
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
  ref: v1.2.13-0-g785fd327ada6fc1778a2bb21176cb66705eb6b33
- kind: patch_queue
  path: patches/alsa-lib
