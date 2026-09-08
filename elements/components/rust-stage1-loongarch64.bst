kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: b9b37095940cf0f4b9cc60bd7f52e7bc997655385e280bfed0ae7acb7c9449ad
