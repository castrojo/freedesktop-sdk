kind: autotools

depends:
- bootstrap-import.bst
- components/bubblewrap.bst
- components/gpgme.bst
- components/libarchive.bst
- components/libxml2.bst
- components/curl.bst
- components/xorg-lib-xau.bst
- components/ostree.bst
- components/fuse3.bst
- components/json-glib.bst
- components/appstream.bst
- components/libseccomp.bst
- components/polkit.bst

build-depends:
- components/python3-pyparsing.bst
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/bison.bst
- components/gettext.bst
- components/gobject-introspection.bst
- components/bison.bst

variables:
  conf-local: >-
    --disable-documentation
    --with-system-bubblewrap
    --with-curl

(@):
- elements/include/flatpak.yml
