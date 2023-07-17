kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.70.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: f0209965ec561d79f076cd6d810188055a4ad68657e5e3c25be451753492864d
