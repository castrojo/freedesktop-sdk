kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.72.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 8410dc14bbb2655370ffe34e3bc4b5c60130ad5c715b3a8c36304da48d1b6001
