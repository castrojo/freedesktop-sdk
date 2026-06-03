kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.94.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: 0f9dde5b24d05ca501a9a31b5c1a2f4786d84beeceabe881bcf9342afb488373
