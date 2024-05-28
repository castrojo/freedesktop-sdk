kind: autotools

depends:
- bootstrap-import.bst
- components/glib.bst

build-depends:
- components/flex.bst
- components/bison.bst
- public-stacks/buildsystem-autotools.bst

variables:
  conf-local: --disable-valadoc
  local_flags: -fpermissive

environment:
  VALAC: /no-valac

config:
  configure-commands:
    (<):
    - touch */*.stamp

sources:
- kind: git_repo
  url: git_https:gitlab.gnome.org/Archive/vala-bootstrap.git
  ref: b2beeaccdf2307ced172646c2ada9765e1747b28
