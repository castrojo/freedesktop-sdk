kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.91.0-i686-unknown-linux-gnu.tar.xz
  ref: a47ee4ed3aa82b6967f2d1fae8b1b04001a48cccc9e3b9af651d75b8efedddb3
