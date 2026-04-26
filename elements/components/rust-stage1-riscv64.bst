kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.94.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: ffe3f2abb92c832d92248d731ec125de1efc29138954be6cab35372eccc79c89
