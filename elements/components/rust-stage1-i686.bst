kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.74.1-i686-unknown-linux-gnu.tar.xz
  ref: f58cdf15717e7f6506088e753ffef3ec655a4ccd932eae280d6cb68b0ee3feca
