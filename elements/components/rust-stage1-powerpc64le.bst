kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.84.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 7cdb3b2a4a374c868cb156a6e10591d0d3e40c987d3ec363bf18349a0143843b
