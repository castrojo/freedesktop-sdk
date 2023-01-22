kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 913e8286a3bc709ee0916fabec31dd9b6703c40b065b1ac59fd2125011a7fb34
