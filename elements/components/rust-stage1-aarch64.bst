kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.88.0-aarch64-unknown-linux-gnu.tar.xz
  ref: d5decc46123eb888f809f2ee3b118d13586a37ffad38afaefe56aa7139481d34
