kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.76.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: e735e133dedfc625fd5a438840901c27c820a1a8d52a2628a440b4128734e6af
