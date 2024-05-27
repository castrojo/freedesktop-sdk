kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.77.2-armv7-unknown-linux-gnueabihf.tar.xz
  ref: f211ff1e939ede5d19aa0ad658d8aa50ba8256b1d108c7cd3665862d987d04f8
