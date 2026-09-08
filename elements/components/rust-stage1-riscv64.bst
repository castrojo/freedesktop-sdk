kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: cad4079134783f9f429446733bdd0b3ea461a4445c633139cd7d5b57a4f5815e
