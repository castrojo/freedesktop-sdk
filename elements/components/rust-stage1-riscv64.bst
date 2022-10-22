kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.63.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: f6f0f40cb1ccf1ea45f2452713067b0efb073f631d52f72415a3b5e6058b064c
