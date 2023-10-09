kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.72.1-aarch64-unknown-linux-gnu.tar.xz
  ref: 40c905d1093d464857f05d37e4ccdfa059baaee9bc5295882f0148c7725633b8
