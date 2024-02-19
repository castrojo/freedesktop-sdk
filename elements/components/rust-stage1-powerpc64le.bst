kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.75.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 05f8a6b80afd307201c0888a5e4c664412c32596f77bdc03196a93b7bbaf6dc4
