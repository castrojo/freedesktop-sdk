kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --disable-valadoc

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
