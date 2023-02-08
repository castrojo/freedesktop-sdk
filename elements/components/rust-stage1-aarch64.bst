kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.65.0-aarch64-unknown-linux-gnu.tar.xz
  ref: b3a83a9585b8c4ede4eab2a11b3f96895f676d8b46c9642140c4fefd5c309ed1
