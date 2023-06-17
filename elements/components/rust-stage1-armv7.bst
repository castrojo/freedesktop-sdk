kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.69.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: d22577fab7be91aa8099c9e494be88c5e1dc45a5ab5783703a89514423bd3876
