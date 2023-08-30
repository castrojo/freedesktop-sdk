kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: afa670835f244adf06486fa5966e106366b39817d7bbae18504cb6767208ebe9
