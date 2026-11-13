kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.99.1-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 88294018ee59ca9528cd273fe5d8148b8d3b04ad08f02adcd000983aa9773820
