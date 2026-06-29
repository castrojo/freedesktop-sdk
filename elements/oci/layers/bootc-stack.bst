kind: stack

depends:
- components/bootc.bst
- oci/bootc-integration/bootc-config.bst
- oci/minimal-oci.bst
- vm/config/sudo.bst
- vm/config/useradd-ostree.bst


public:
  bst:
    integration-commands:
    # Required for bootc to create the image
    - mkdir /boot
    - mkdir /sysroot

    - rm --verbose --recursive --force /root
    # It doesn't exist but it will get created
    # by the 10-bootc.conf tmpfiles
    - ln -s /var/home /home
    - ln -s /var/roothome /root
    - touch /etc/machine-id
