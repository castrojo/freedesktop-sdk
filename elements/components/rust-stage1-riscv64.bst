kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.81.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: bc4c50240344882e1c192038cc04daea760792c6aaafa928ae1058f6f4cda437
