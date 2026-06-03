kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.94.0-i686-unknown-linux-gnu.tar.xz
  ref: ab0166b5cd5a02649f2b842d1816d3b8074d8409696035ea71539d3bb693ed6d
