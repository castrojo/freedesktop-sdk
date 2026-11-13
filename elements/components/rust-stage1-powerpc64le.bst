kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.99.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 6791ac9124ac16d883f9f78e39e29a6a34230ab0bddade975ee9aae53a2933b8
