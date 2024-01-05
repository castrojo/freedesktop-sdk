kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 054a98e8e85e94c187ff8bc16bac8011747839c9ad73584fdd87b904f137eb23
