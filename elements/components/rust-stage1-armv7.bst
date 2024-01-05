kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.74.1-armv7-unknown-linux-gnueabihf.tar.xz
  ref: d10db262196d59db9c910584f7cf9d7e5b5969910f343c64a79197f15cf2b694
