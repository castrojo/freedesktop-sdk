kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.65.0-i686-unknown-linux-gnu.tar.xz
  ref: 50595b96f98e0940bbfe00209d6c233e9158e140ecd6088ad3bd53f89b123e9d
