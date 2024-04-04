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
      ln -srL %{install-root}%{extlibdir}/libopenh264.so* %{install-root}%{libdir}

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
- kind: git_repo
  url: github:endlessm/noopenh264.git
  # There is no tag for 2.2.0
  # This is a tag for 2.3.0 but the patches revert the version back to 2.2.0
  ref: Version_2.3.0+really2.2.0-3-ga5f2e4af2edf20e0054a198bc4a163b8b4be2dd7
  exclude:
  - Release*
