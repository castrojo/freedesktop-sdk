kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.71.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: 8885b03634698a83dedad84e25a216a91d5d4d52a73e7bb2b85d15844edfb2b3
