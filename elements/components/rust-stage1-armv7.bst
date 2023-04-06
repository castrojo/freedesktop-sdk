kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.67.1-armv7-unknown-linux-gnueabihf.tar.xz
  ref: d05c97b72b236a8dcddcb6f4ddfb7c8a49ad627a3038a8f7b4952085e246b29f
