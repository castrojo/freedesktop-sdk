kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.98.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 06871396a06f61f2d72f57b5ed31a0da69e8185af3989d2efb2665c6e982c062
