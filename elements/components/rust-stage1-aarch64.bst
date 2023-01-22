kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.64.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 9081928cced6fc650eaccb88f2ea154dc95c066957b234fa9c0cbe1770479f54
