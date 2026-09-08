kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 875963c3080f6c4ae005e8451d418e50f384452bded8cf22d80dc7a862f9d51f
