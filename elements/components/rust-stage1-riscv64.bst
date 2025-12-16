kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.91.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 355c19eb1f7c2dc02b7c832247aeadc1de8a3ad72bbb9892618369ccdc21970b
