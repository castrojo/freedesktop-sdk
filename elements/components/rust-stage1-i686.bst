kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.0-i686-unknown-linux-gnu.tar.xz
  ref: 350e11f486d12e53849e267106a372d7f4e2da9e8996d05fc0a198b60260c723
