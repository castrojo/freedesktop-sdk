kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.81.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: aca2ff839c6ac288ee037926ec15d78315977a5945f515505db0b248d7c3094c
