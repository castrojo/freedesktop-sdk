kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url:
    tar_https:static.rust-lang.org/dist/rust-1.79.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 40d7dd809c873f9462a35735c511d82ba0e46edb56c74e8da01ff3a002bef2aa
