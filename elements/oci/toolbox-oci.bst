kind: script

build-depends:
- oci/oci-builder.bst
- oci/layers/toolbox-init-script.bst
- filename: oci/sdk-oci.bst
  config:
    location: /parent
- filename: oci/layers/toolbox.bst
  config:
    location: /layer

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

config:
  commands:
  - mkdir -p /fakecap
  - |
    if [ -d /initial_scripts ]; then
      for i in /initial_scripts/*; do
        "${i}" /layer
      done
    fi

  - |
    cd "%{install-root}"
    build-oci <<EOF
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Make the image toolbox ready"
      config:
        Labels:
          'com.github.containers.toolbox': 'true'
          'com.github.debarshiray.toolbox': 'true'
      index-annotations:
        org.opencontainers.image.ref.name: localhost/freedesktopsdk/toolbox:latest
    EOF
