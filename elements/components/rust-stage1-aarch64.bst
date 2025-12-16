kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.91.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 62b2b7aeba3a629783263742fc50e7a097349f8dd2d7cdf394ab2723a6b3c7ee
