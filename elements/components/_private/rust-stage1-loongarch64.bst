kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.91.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: 225bbde56f8a4a59375061aa378308d5257ada6813d612aab150761fafb5b368
