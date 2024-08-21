kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.79.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: 11ac4303dfb6a8b86cc58792b154dd730a9dcba177d73ab38e8daae3c0519ef0
