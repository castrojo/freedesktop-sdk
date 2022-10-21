kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.63.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: 81e9e3dc569047f2a26512609978a4e5d4c06a05a071d44a6d9aadb4d7cbc079
