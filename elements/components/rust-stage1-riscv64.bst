kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 3021ad1c6f5c5d177546f9890acaac105fbfc211bfd4b11fc06156f85112df09
