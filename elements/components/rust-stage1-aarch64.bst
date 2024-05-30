kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.77.2-aarch64-unknown-linux-gnu.tar.xz
  ref: a800a3aca502632b46ccc64aee607e0293ef76390744901a2cfd111930999b44
