kind: meson

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-meson.bst

variables:
  (@):
  - include/repo_branches.yml

config:
  configure-commands:
    (<):
    - grep "matching_version = '%{openh264-version}'" %{build-root}/meson.build

  install-commands:
    (>):
    - |
      rm %{install-root}%{libdir}/libopenh264.a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopenh264.so'

sources:
- kind: git_repo
  url: github:endlessm/noopenh264.git
  track: Version_*
  # There is no tag for 2.2.0
  # This is a tag for 2.3.0 but the patches revert the version back to 2.2.0
  ref: Version_2.3.0+really2.2.0-0-g94b684a3ea96c48231afcacfdcff25414ee784fc
  exclude:
  - Release*
