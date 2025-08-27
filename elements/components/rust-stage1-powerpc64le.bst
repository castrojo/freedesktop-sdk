kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 4e429d0c390032e556cea9a5729b8abc035aa421a1ad3ac232b63308705c14bb
