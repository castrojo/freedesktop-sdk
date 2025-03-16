kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.84.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 74e0a75cb6d48975c75cf49b5434c921d6bed16937e1f6091eaffb524761c6e1
