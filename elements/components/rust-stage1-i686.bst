kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.84.0-i686-unknown-linux-gnu.tar.xz
  ref: 12b46802eb72268bd55d1bd69a2eaa13871f89b0c38c73418d8eeea6fae869d7
