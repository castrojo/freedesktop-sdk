kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.78.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: d6c7eb804496bcb7773389dd5db673cd6737608e8ff7261d32bd3ebd20ffaa7a
