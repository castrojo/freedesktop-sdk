kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.63.0-i686-unknown-linux-gnu.tar.xz
  ref: 17081489b7efeb3936ed9bee2d21deaa86d76c3fed9be9e582c4325ca6aafae8
