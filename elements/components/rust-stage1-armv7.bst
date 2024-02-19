kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.75.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: b94936e2d2ad370388629252af6a3ded058904ecfaabd7c17e1569361828d2bc
