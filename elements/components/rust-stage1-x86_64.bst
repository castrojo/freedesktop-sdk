kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.67.1-x86_64-unknown-linux-gnu.tar.xz
  ref: 7dbb718bdb09adad7e36b9a413e571863913682495527f7f2d6507ea2c068542
