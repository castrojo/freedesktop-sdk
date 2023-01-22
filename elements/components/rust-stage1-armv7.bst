kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.64.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: cad59223ac104dfb3f1ede0efb59f7212f2186da06b5d408cdfaf4710e2b9637
