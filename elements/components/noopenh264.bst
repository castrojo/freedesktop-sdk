kind: meson

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-meson.bst

variables:
  (@):
  - include/repo_branches.yml
  extlibdir: "%{libdir}/openh264/extra"
  meson-local: "--libdir=%{extlibdir}"

config:
  configure-commands:
    (<):
    - grep "matching_version = '%{openh264-version}'" %{build-root}/meson.build

  install-commands:
    (>):
    - |
      mv "%{install-root}%{extlibdir}/pkgconfig/" "%{install-root}%{libdir}"

    - |
      cp -P %{install-root}%{extlibdir}/libopenh264.so* %{install-root}%{libdir}

    - |
      rm %{install-root}%{extlibdir}/libopenh264.a

    - |
      ln -srL %{install-root}%{libdir}/libopenh264.so %{install-root}%{libdir}/libopenh264.so.5 

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{extlibdir}/libopenh264.so'
        - '%{libdir}/libopenh264.so'

sources:
- kind: git_tag
  url: github:endlessm/noopenh264.git
  track: master
  # There is no tag for 2.2.0
  # This is a tag for 2.3.0 but the patches revert the version back to 2.2.0
  track-tags: false
  ref: Version_2.3.0-0-g750147f1e5af5cd9f47ffabef996c335b1ba0481
  exclude:
  - Release*
- kind: patch_queue
  path: patches/noopenh264
