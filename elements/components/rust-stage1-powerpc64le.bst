kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.63.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 763ac0659b3a7f3a57ff9eb01f4c77eaf8485bd19997ec6fdf2149afb3823ca8
