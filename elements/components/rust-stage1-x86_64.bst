kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 1cf17e4905b841d4c8e3f76467ac148d55fb3f54bf213c86f0d287a36471d904
