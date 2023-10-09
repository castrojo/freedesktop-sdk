kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.72.1-i686-unknown-linux-gnu.tar.xz
  ref: 28e77745cdd2042953363fd3a9735eb9a9bd806cecdd18f20163cf588bb103f2
