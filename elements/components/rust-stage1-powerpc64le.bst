kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 574851ff8503df9cb0dd04e6a1cd0ce5d709b5ea8b9c1265b314b9e182c818da
