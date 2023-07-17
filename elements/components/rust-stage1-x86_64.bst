kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.70.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 991b59d1d0cd0dfcb2463bd79d2df1a235380f725557cdee831ee3c1d87a3122
