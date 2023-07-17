kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 41093804c33ea79f8643566ad6cfff5c4f0755418d73abcdf774c870dd8a2e0e
