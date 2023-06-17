kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.69.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 0b57f729fdf869f5f0d39ae0573a8855380bed471aee7cc6996d34ffd013af66
