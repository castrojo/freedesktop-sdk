kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.65.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: c34e277f6883e0038633175b55d0af858a1f8d329c65d83fa00d125edb063352
