kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.86.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: 7afcf30876a379f74a1dc26b50dbea5afb0a2d8735a38b12f10f9e8a6d76b8d1
