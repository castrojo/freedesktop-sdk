kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.72.1-armv7-unknown-linux-gnueabihf.tar.xz
  ref: af303237a240dce9dcb6366b947d56903c36f5de08636b60267cf40c74ba332d
