kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.75.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: fa5a6911cccad0aee8d00a4657ee577122f4d3014672c0cd31583c362029d4c0
