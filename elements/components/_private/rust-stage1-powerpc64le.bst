kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.91.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 6d3df698df5733a85e948cc2f443cfbcacd013d4f72dd2b97aa712bfea23d210
