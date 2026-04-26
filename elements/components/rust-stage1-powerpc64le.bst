kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.94.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: b148e37daa3f50fcf087b788c8f3b31f7838b8f22eaa263b0adad7bf2e166c2f
