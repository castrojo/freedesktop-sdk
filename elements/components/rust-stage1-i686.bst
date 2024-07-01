kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.78.0-i686-unknown-linux-gnu.tar.xz
  ref: 58f7bed29a81cff8bace4cfacd91e6396eb03b830ac836fcf3c014541bb307cc
