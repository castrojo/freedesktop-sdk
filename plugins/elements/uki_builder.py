import buildstream
import shlex


class UkiBuilderElement(buildstream.ScriptElement):
    BST_MIN_VERSION = "2.0"

    def configure(self, node):
        node.validate_keys(["kernel-cmdline", "root-read-only"])

        uuidnamespace = self.get_variable("uuidnamespace")
        libdir = self.get_variable("libdir")
        kernel_cmdline = node.get_str(
            "kernel-cmdline", "rw console=tty0 console=ttyS0 quiet root=UUID=${uuid_root}"
        )
        escaped_cmdline = kernel_cmdline.replace("\\", "\\\\").replace('"', '\\"')

        self.add_commands(
            "commands",
            [
                "mkdir -p /fakecap",
                "mkdir -p /tmp",
                "mkdir -p /var/tmp",
                "mkdir -p /boot",
                f"""prepare-image.sh --sysroot / --rootpasswd root \\
                 --seed {shlex.quote(uuidnamespace)} --noroot >/tmp/vars""",
                "dbus-uuidgen >/etc/machine-id",
                "SYSTEMD_ESP_PATH=/boot bootctl --no-variables install",
                "rm /etc/machine-id",
                """cat <<EOF >/boot/loader/loader.conf
timeout 3
editor yes
console-mode keep
EOF""",
                f"echo {shlex.quote(libdir)} >/etc/ld.so.conf",
                f""". /tmp/vars
version="$(ls -1 /lib/modules | head -n1)"
dracut -v --xz --reproducible --fstab \\
       --no-machineid --kernel-image "/lib/modules/${{version}}/vmlinuz" \\
       --kver $(ls -1 /lib/modules | head -n1) \\
       --kernel-cmdline "{escaped_cmdline}" \\
       --kernel-image "/lib/modules/$(ls -1 /lib/modules | head -n1)/vmlinuz" \\
       --install 'fsck.ext4'""",
                f'''. /tmp/vars
version="$(ls -1 /lib/modules | head -n1)"
mkdir -p /boot/EFI/Linux
ukify build \\
  --linux="/lib/modules/${{version}}/vmlinuz" \\
  --initrd="/boot/initramfs-${{version}}.img" \\
  --cmdline="{escaped_cmdline}" \\
  --os-release=/etc/os-release \\
  --output="/boot/EFI/Linux/freedesktopsdk_${{version}}.efi"''',
                """. /tmp/vars
version="$(ls -1 /lib/modules | head -n1)"
cat <<EOF >/boot/loader/entries/freedesktopsdk-uki.conf
title Freedesktop SDK (UKI)
version ${version}
efi /EFI/Linux/freedesktopsdk_${version}.efi
EOF""",
                """if [ -e /boot/vmlinuz ]; then
  rm /boot/vmlinux
fi""",
            ],
        )

        self.set_work_dir()
        self.set_install_root()
        self.set_root_read_only(node.get_bool("root-read-only", default=False))

    def configure_dependencies(self, dependencies):
        for dependency in dependencies:
            location = "/"
            if dependency.config:
                dependency.config.validate_keys(["location"])
                location = dependency.config.get_str("location", location)
            self.layout_add(dependency.element, dependency.path, location)


def setup():
    return UkiBuilderElement
