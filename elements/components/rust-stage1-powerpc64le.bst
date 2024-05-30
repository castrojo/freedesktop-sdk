kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.77.2-powerpc64le-unknown-linux-gnu.tar.xz
  ref: a02777d7c748166fae35170a1b782febe3f6023829d533ae43c3924fa7ffa06a
