kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: e0654c20446aa5c66def122617f3ca4be9e9b86e75040327e3d35973b6b88980
