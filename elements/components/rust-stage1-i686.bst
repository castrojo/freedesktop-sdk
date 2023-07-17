kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.70.0-i686-unknown-linux-gnu.tar.xz
  ref: e3fb7f9d825e1bd1720765a358361ba4517584f6d0c1a1d80b2230e2f97c9b88
