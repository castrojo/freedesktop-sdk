kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.78.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 98d26968ff98b9fd28ef286dceed46cd9df803282e067a014c0a4cb0e9b4d2f2
