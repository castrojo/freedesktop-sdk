kind: script

build-depends:
- bootstrap-import.bst
- snap-images/squashfs-tools.bst
- filename: snap-images/platform.bst
  config:
    location: "/images/platform"
- filename: snap-images/vulkaninfo.bst
  config:
    location: "/images/vulkaninfo"
- filename: snap-images/vainfo.bst
  config:
    location: "/images/vainfo"
- filename: snap-images/clinfo.bst
  config:
    location: "/images/clinfo"
- filename: snap-images/glxinfo.bst
  config:
    location: "/images/glxinfo"

config:
  commands:
  - |
    mkdir -p "%{install-root}"
    for name in platform sdk vulkaninfo vainfo clinfo glxinfo; do
      mksquashfs "/images/${name}" "%{install-root}/${name}.snap" \
        -root-owned -noappend -comp xz -no-xattrs -no-fragments
    done
