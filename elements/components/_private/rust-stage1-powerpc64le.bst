kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.92.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 969d854af42dc47bf70359d6255782557dc2ca911d0078e1d3894585f5309639
