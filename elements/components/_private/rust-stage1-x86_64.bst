kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.92.0-x86_64-unknown-linux-gnu.tar.xz
  ref: d2ccef59dd9f7439f2c694948069f789a044dc1addcc0803613232af8f88ee0c
