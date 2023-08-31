kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.71.0-i686-unknown-linux-gnu.tar.xz
  ref: afd7148aaacdd38acb2f02ded9dd31c833d6f20d99f3f4b5617282295d2092d7
