branch := '26.08beta'

arch := replace_regex(`uname -m`, '^i.86$', 'i686')
bootstrap_arch := replace_regex(`uname -m`, '^i.86$', 'i686')

flatpak_arch := if arch == 'i686' {
  'i386'
} else if arch == 'ppc64le' {
  'ppc64le'
} else {
  arch
}

qemu_arch := if arch == 'i386' {
  'i386'
} else if arch == 'ppc64le' {
  'ppc64'
} else {
  arch
}

repo := 'repo'
checkout_root := 'runtimes'

vm_checkout_root := f'checkout/{{arch}}'
vm_artifact_filesystem := 'vm/minimal/virt.bst'
vm_artifact_boot := 'vm/boot/virt.bst'
vm_artifact_image := 'vm/minimal/efi.bst'
vm_machine_id := ''

runtime_version := 'master'
qemu_graphics := '-nographic'

flatpak_subject := `git rev-parse HEAD`
last_version := trim(`awk '/^Version:/ {print $2; exit}' NEWS.yml`)

snap_grade := 'devel'
minimal_vm := 'locale'

arch_options := f" -o bootstrap_build_arch {{bootstrap_arch}} -o target_arch {{arch}} -o snap_grade {{snap_grade}} -o minimal_vm {{minimal_vm}}"

abi := if arch == 'arm' {
  'gnueabi'
} else {
  'gnu'
}

tarballs := "sdk platform"
tar_elements := prepend('tarballs/', append('.bst', tarballs))
tar_checkout_root := 'tarballs'

bst_program := require(env("BST", "bst"))
bst := bst_program + arch_options
qemu := require(f"qemu-system-{{qemu_arch}}")

default: build

# Pull or build the default set of elements
build:
    #!/bin/bash
    {{bst}} build tests/check-platform.bst \
                 tests/check-sdk.bst \
                 components.bst \
                 flatpak-release-repo.bst \
                 public-stacks/buildsystems.bst \
                 oci/layers/{minimal,debug,platform,sdk,flatpak}.bst

# Pull or build the sdk and platform tarballs
build-tar:
    {{bst}} build {{tar_elements}}

# Pull or build the bootstrap elements only.
bootstrap:
    {{bst}} build bootstrap/bootstrap.bst

# Pull or build the Flatpak release repo.
build-repo:
    {{bst}} build flatpak-release-repo.bst

# Export stored artifacts from local cache.
#
# Use the 'build' job to make artifacts available in the local cache.
export: #clean-runtime
    mkdir -p {{checkout_root}}
    {{bst}} artifact checkout flatpak-release-repo.bst --directory {{checkout_root}}/flatpak-release-repo.bst

    test -e {{repo}} || ostree init --repo={{repo}} --mode=archive

    flatpak build-commit-from --src-repo={{checkout_root}}/flatpak-release-repo.bst --subject {{flatpak_subject}} --disable-fsync {{repo}}

    rm -rf {{checkout_root}}

export-tar: build-tar
    rm -rf {{tar_checkout_root}}
    mkdir -p {{tar_checkout_root}}
    set -e; for tarball in {{tarballs}}; do \
        dir="{{arch}}-${tarball}"; \
        mkdir -p "{{tar_checkout_root}}/${dir}"; \
        {{bst}} artifact checkout "tarballs/${tarball}.bst" --tar - | xz -T0 > "{{tar_checkout_root}}/${dir}/freedesktop-${tarball}-{{arch}}.tar.xz"; \
    done

ovmf_vars := vm_checkout_root / 'efi_vars.fd'
ovmf_vars_template := vm_checkout_root / 'ovmf/usr/share/ovmf/OVMF_VARS.fd'
ovmf_code := if arch == 'aarch64' {
  vm_checkout_root / 'ovmf/usr/share/ovmf/QEMU_EFI.fd'
} else {
  vm_checkout_root / 'ovmf/usr/share/ovmf/OVMF_CODE.fd'
}

qemu_common_args := \
  '-m 2G ' + \
  '-smp 4 ' + \
  '-object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 ' + \
  qemu_graphics + \
  if vm_machine_id != '' { f'-uuid {{vm_machine_id}} ' } else { '' }

qemu_virtfs_args := \
  f'-kernel {{vm_checkout_root}}/{{vm_artifact_boot}}/vmlinuz ' + \
  f'-initrd {{vm_checkout_root}}/{{vm_artifact_boot}}/initramfs.gz ' + \
  f'-virtfs local,id=virtfs,path={{vm_checkout_root}}/{{vm_artifact_filesystem}},security_model=none,mount_tag=virtfs '

qemu_virtfs_arch_args := \
  if arch == 'x86_64' {
    "-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap console=ttyS0'"
  } else if arch == 'aarch64' {
    "-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap init=/usr/lib/systemd/systemd console=ttyAMA0"
  } else if arch == 'ppc64le' {
    "-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap init=/usr/lib/systemd/systemd console=ttyS0'"
  } else {
    ''
  }

qemu_efi_args := \
  f'-drive if=pflash,format=raw,unit=0,file={{ovmf_code}},readonly=on ' + \
  f'-drive if=pflash,format=raw,unit=1,file={{ovmf_vars}} '

qemu_net_args := \
  '-netdev user,id=net1 -device virtio-net,netdev=net1 '

qemu_tpm_args := \
  f"-chardev socket,id=chrtpm,path={{absolute_path(vm_checkout_root)}}/tpm/sock " + \
  '-tpmdev emulator,id=tpm0,chardev=chrtpm ' + \
  '-device tpm-tis,tpmdev=tpm0 '

qemu_arch_args := \
  if arch == 'x86_64' {
    '-M q35,accel=kvm '
  } else if arch == 'aarch64' {
    '-machine type=virt,accel=kvm' +
    '-cpu max '
  } else if arch == 'ppc64le' {
    '-machine pseries '
  } else {
    ''
  }


# Pull or build virtual machine image
build-vm:
    {{bst}} build {{vm_artifact_filesystem}} {{vm_artifact_boot}}

# Export virtual machine image
[script]
export-vm:
    {{bst}} artifact checkout {{vm_artifact_filesystem}} --directory {{vm_checkout_root}}/{{vm_artifact_filesystem}}
    {{bst}} artifact checkout {{vm_artifact_boot}} --directory {{vm_checkout_root}}/{{vm_artifact_boot}}
    case {{arch}} in
    aarch64|x86_64)
        echo "Checking out firmware variables"
        {{bst}} build components/_private/ovmf.bst
        {{bst}} artifact checkout components/_private/ovmf.bst --directory {{vm_checkout_root}}/ovmf
        cp {{ovmf_vars_template}} {{ovmf_vars}}
    esac

# Remove virtual machine artifacts
clean-vm: copy-artifacts
    rm -rf {{vm_checkout_root}}/{{vm_artifact_filesystem}}
    rm -rf {{vm_checkout_root}}/{{vm_artifact_boot}}
    rm -rf {{vm_checkout_root}}/ovmf
    rm -rf {{ovmf_vars}}

# Run virtual machine in QEMU
run-vm:
    unshare --map-root-user {{qemu}} \
      {{qemu_common_args}} \
      {{qemu_virtfs_args}} \
      {{qemu_virtfs_arch_args}} \
      {{qemu_arch_args}} \
      {{
        if arch == 'x86_64' {
          qemu_efi_args
        } else if arch == 'aarch64' {
          qemu_efi_args
        } else {
          ''
        }
      }}

# Fetch or build `elements/tests/check-abi*.bst`
[script]
check-abi:
    {{bst}} build tests/check-abi-mesa.bst \
                 tests/check-abi-extra.bst \
                 tests/check-abi.bst; \
    exit_code="$?"; \
    if [ "${CI}" = "true" ]; then \
        mv ${XDG_CACHE_HOME}/buildstream/build/tests-check-abi-*/root/libabigail-tars .; \
    fi; \
    exit ${exit_code}

# Fetch or build `elements/tests/check-debuginfo.bst`
check-debuginfo:
    {{bst}} build tests/check-debuginfo.bst

# Fetch or build `elements/tests/check-dev-files.bst`
check-dev-files:
    {{bst}} build tests/check-dev-files.bst

# Fetch or build `elements/tests/check-rpath.bst`
check-rpath:
    {{bst}} build tests/check-rpath.bst

# Fetch or build `elements/tests/check-static-libraries.bst`
check-static-libraries:
    {{bst}} build tests/check-static-libraries.bst

# Fetch or build `elements/utils/generate-cve-report.bst` and export the report
[script]
generate-cve-report: manifest
    {{bst}} build utils/generate-cve-report.bst

    [ -d "nvd-cve-database" ] || ( \
        git clone -n --depth=1 --filter=tree:0 https://gitlab.com/freedesktop-sdk/nvd-cve-database.git && \
        cd nvd-cve-database && git sparse-checkout set nvd-cve-database && \
        git checkout && \
        rm -rf ".git" \
    )

    mkdir -p cve/cve-reports

    for name in "sdk platform components"; do
        cp -vf ${name}-manifest/usr/manifest.json cve/${name}-manifest.json;)

    cp -r nvd-cve-database/nvd-cve-database/*.json.gz cve/

    {{bst}} shell utils/generate-cve-report.bst \
        --mount ./cve/ /buildstream-build \
        -- sh -c '\
            generate_cve_report --db-path /buildstream-build --feed-version 2.0 /buildstream-build/sdk-manifest.json /buildstream-build/cve-reports/sdk.md.html && \
            generate_cve_report --db-path /buildstream-build --feed-version 2.0 /buildstream-build/platform-manifest.json /buildstream-build/cve-reports/platform.md.html && \
            generate_cve_report --db-path /buildstream-build --feed-version 2.0 /buildstream-build/components-manifest.json /buildstream-build/cve-reports/components.md.html \
        '

    rm -rvf cve-reports
    mv -v cve/cve-reports .
    rm -rf cve

    rm -rf sdk-manifest platform-manifest components-manifest
    rm -rf nvd-cve-database

# Generate manifests of sdk, platform and components in JSON format.
manifest:
    rm -rf sdk-manifest/
    rm -rf platform-manifest/
    rm -rf components-manifest/

    {{bst}} build manifests/platform-manifest.bst manifests/sdk-manifest.bst manifests/components-manifest.bst

    {{bst}} artifact checkout manifests/platform-manifest.bst --directory platform-manifest/
    {{bst}} artifact checkout manifests/sdk-manifest.bst --directory sdk-manifest/
    {{bst}} artifact checkout manifests/components-manifest.bst --directory components-manifest/

# Generate manifests in Markdown format.
markdown-manifest: manifest
    python3 utils/jsontomd.py platform-manifest/usr/manifest.json
    python3 utils/jsontomd.py sdk-manifest/usr/manifest.json

# Generate manifest of source URLs.
url-manifest:
    python3 utils/url_manifest.py release-url-manifest/url-manifest-no-mirrors.json \
      flatpak-release-repo.bst components.bst \
      components/_private/rust-stage1-x86_64.bst components/_private/rust-stage1-i686.bst components/_private/rust-stage1-aarch64.bst \
      components/_private/rust-stage1-powerpc64le.bst \
      oci/layers/flatpak.bst oci/layers/debug.bst oci/layers/platform.bst oci/layers/sdk.bst

# Run Flatpak application test cases against the built Flatpak runtime
#
# You must run `export` first.
test-apps:
    #!/bin/bash
    set -x
    export XDG_DATA_HOME={{justfile_dir()}}/runtime
    echo ${XDG_DATA_HOME}
    mkdir -p runtime
    flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo {{repo}}
    flatpak install -y --arch={{flatpak_arch}} --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk}//{{branch}}
    flatpak list

    flatpak-builder --arch={{flatpak_arch}} --force-clean app tests/org.flatpak.Hello.json
    flatpak-builder --arch={{flatpak_arch}} --run app tests/org.flatpak.Hello.json hello

    flatpak-builder --arch={{flatpak_arch}} --force-clean app tests/org.gnu.Hello.json
    flatpak-builder --arch={{flatpak_arch}} --run app tests/org.gnu.Hello.json hello

    flatpak-builder --arch={{flatpak_arch}} --force-clean --user --install app tests/org.flatpak.GstreamerPlugins.json
    flatpak --arch={{flatpak_arch}} run org.flatpak.GstreamerPlugins

    flatpak-builder --arch={{flatpak_arch}} --force-clean app tests/org.flatpak.Readline.json

    flatpak-builder --arch={{flatpak_arch}} --force-clean --user --install app tests/io.freedesktop_sdk.SimpleProject.json
    flatpak --arch={{flatpak_arch}} run io.freedesktop_sdk.SimpleProject

    flatpak-builder --arch={{flatpak_arch}} --force-clean --user --install app tests/io.freedesktop_sdk.ComplexMaths.json
    flatpak --arch={{flatpak_arch}} run io.freedesktop_sdk.ComplexMaths

    flatpak-builder --arch={{flatpak_arch}} --force-clean --user --install app tests/io.freedesktop_sdk.perl_module.json
    flatpak --arch={{flatpak_arch}} run io.freedesktop_sdk.perl_module

    flatpak-builder --arch={{flatpak_arch}} --force-clean --user --install app tests/io.freedesktop_sdk.test_mktime.json
    flatpak --arch={{flatpak_arch}} run io.freedesktop_sdk.test_mktime

# Run Flatpak codec test cases against the built Flatpak runtime
#
# You must run `export` first.
test-codecs:
    #!/bin/bash
    export XDG_DATA_HOME={{justfile_dir()}}/runtime
    echo ${XDG_DATA_HOME}

    flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo {{repo}}
    flatpak install -y --arch={{flatpak_arch}} --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk}//{{branch}}

    flatpak-builder --arch={{flatpak_arch}} --force-clean --repo={{repo}} app tests/test.codecs.codecs-extra.json

    flatpak-builder --arch={{flatpak_arch}} --force-clean --repo={{repo}} app tests/test.libheif_plugins.codecs-extra.json

    # Expect full codecs
    flatpak install -y --arch={{flatpak_arch}} --user fdo-sdk-test-repo test.codecs.codecs-extra
    flatpak install -y --arch={{flatpak_arch}} --user fdo-sdk-test-repo test.libheif_plugins.codecs-extra

    flatpak run test.libheif_plugins.codecs-extra

    # Expect full codecs
    flatpak run test.codecs.codecs-extra

    # Expect free codecs
    flatpak uninstall --no-related --force-remove -y --noninteractive org.freedesktop.Platform.codecs-extra
    flatpak run test.codecs.codecs-extra

    flatpak uninstall -y --all

# Test runtime inheritance
#
# You must run `export` first.
test-runtime-inheritance:
    #!/bin/bash
    export XDG_DATA_HOME={{justfile_dir()}}/runtime
    echo ${XDG_DATA_HOME}
    flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo {{repo}}
    flatpak install -y --arch={{flatpak_arch}} --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk{,.Debug,.Docs,.Locale}}//{{branch}}
    flatpak-builder --arch={{flatpak_arch}} --force-clean app tests/org.flatpak.ExampleRuntime.json


# Test dynamic linker
#
# You must run `export` first.
test-ldd:
    #!/bin/bash
    export XDG_DATA_HOME={{justfile_dir()}}/runtime
    echo ${XDG_DATA_HOME}
    flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo {{repo}}
    flatpak install -y --arch={{flatpak_arch}} --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk}//{{branch}}

    flatpak-builder --arch={{flatpak_arch}} --force-clean --user --install app tests/test.ldd.check.json
    flatpak-builder --arch={{flatpak_arch}} --force-clean --user --install app tests/test.library.tracker.json

    flatpak --arch={{flatpak_arch}} run --devel test.ldd.check
    flatpak --arch={{flatpak_arch}} run test.ldd.check

    flatpak --arch={{flatpak_arch}} run --filesystem={{invocation_dir()}} --devel test.library.tracker --list
    flatpak --arch={{flatpak_arch}} run --filesystem={{invocation_dir()}} test.library.tracker --check --ignore tests/sdk_only_libs.json

    flatpak uninstall -y --all

# Remove the SDK and Runtime repo
clean-repo:
    rm -rf {{repo}}

# Remove the runtime checkout
clean-runtime:
    rm -rf {{checkout_root}}

# Remove test data
clean-test:
    rm -rf app/
    rm -rf .flatpak-builder/
    rm -rf runtime/

# Remove container images
clean-oci:
    rm -f minimal-oci.tar debug-oci.tar flatpak-oci.tar platform-oci.tar sdk-oci.tar toolbox-oci.tar

# Remove UEFI Secure Boot keys
clean-boot-keys:
    find files/boot-keys -maxdepth 2 ! -path "files/boot-keys/modules/.keep" ! -path "files/boot-keys/modules" ! -path "files/boot-keys" -exec rm -rvf {} +

# Remove generated CVE reports
clean-cve:
    rm -rf cve-reports cve platform-manifest sdk-manifest

# Remove all generated files
clean: clean-repo clean-runtime clean-test clean-vm clean-efi-vm clean-oci clean-boot-keys

# Pull/build and export Snap runtime
export-snap:
    {{bst}} build "snap-images/images.bst"
    {{bst}} artifact checkout "snap-images/images.bst" --directory snap/

# Pull/build and export container images
[script]
export-oci:
    {{bst}} build oci/platform-oci.bst \
                 oci/sdk-oci.bst \
                 oci/debug-oci.bst \
                 oci/flatpak-oci.bst \
                 oci/toolbox-oci.bst
    set -e; \
    for name in platform sdk debug flatpak toolbox; do \
      {{bst}} artifact checkout "oci/${name}-oci.bst" --tar "${name}-oci.tar"; \
    done

# Pull/build, export and test the container images
[script]
test-oci:
    {{bst}} build oci/flatpak-oci.bst; \
    {{bst}} artifact checkout "oci/flatpak-oci.bst" --tar "flatpak-oci.tar"; \
    set -e; \
    if podman --version >/dev/null 2>&1; then \
        IMAGE=$(podman load -i flatpak-oci.tar | grep -E "^Loaded image:" | cut -d' ' -f3); \
        podman run --rm $IMAGE sh --version; \
    fi

export OSTREE_GPG_CONFIG := (
  "Key-Type: DSA\n" +
  "Key-Length: 1024\n" +
  "Subkey-Type: ELG-E\n" +
  "Subkey-Length: 1024\n" +
  "Name-Real: OSTree Freedesktop SDK TEST\n" +
  "Expire-Date: 0\n" +
  "%no-protection\n" +
  "%commit\n" +
  "%echo finished\n"
)

ostree_gpg_key := 'files/vm/ostree-config/fdsdk.gpg'

# Generate a key pair for signing OSTree commits (for the example OSTree-based VM)
[script]
ostree-gpg:
    rm -rf ostree-gpg.tmp
    mkdir ostree-gpg.tmp
    chmod 0700 ostree-gpg.tmp
    echo "${OSTREE_GPG_CONFIG}" >ostree-gpg.tmp/key-config
    gpg --batch --homedir=ostree-gpg.tmp --generate-key ostree-gpg.tmp/key-config
    gpg --homedir=ostree-gpg.tmp -k --with-colons | sed '/^fpr:/q;d' | cut -d: -f10 >ostree-gpg.tmp/default-id
    mv ostree-gpg.tmp ostree-gpg
    gpg --homedir=ostree-gpg --export --armor >{{ostree_gpg_key}}

local_address := trim(`ip route get 1.1.1.1 | cut -d" " -f7`)
ostree_branch := 'freedesktop-sdk/minimal' / branch / arch

# Copy file size report artifacts into root of the VM checkout directory.
[script]
copy-artifacts:
    rm -rf {{vm_checkout_root}}/*sizes*.tsv
    if [ -d "{{vm_checkout_root}}" ]; then \
        echo "Saving file size report artifacts"; \
        find {{vm_checkout_root}} -type f -iname "*sizes*.tsv" -exec echo "File size report {}" ';'  -exec cp {} {{vm_checkout_root}}/ ';' ; \
        find {{vm_checkout_root}} -mindepth 2 -type f -iname "*sizes*.tsv" -delete ; \
    else \
        echo "{{vm_checkout_root}} not found"; \
    fi;

# Remove EFI VM artifacts
clean-efi-vm: copy-artifacts
    rm -rf {{vm_checkout_root}}/{{vm_artifact_image}}
    rm -rf {{vm_checkout_root}}/ovmf
    rm -rf {{ovmf_vars}}

# Fetch or build EFI VM
build-efi-vm:
    {{bst}} build {{vm_artifact_image}}

# Export EFI VM
[script]
export-efi-vm: build-efi-vm
    {{bst}} artifact checkout {{vm_artifact_image}} --directory {{vm_checkout_root}}/{{vm_artifact_image}}
    case {{arch}} in
    aarch64|x86_64)
        echo "Checking out firmware variables"
        {{bst}} build components/_private/ovmf.bst
        {{bst}} artifact checkout components/_private/ovmf.bst --directory {{vm_checkout_root}}/ovmf
        cp {{ovmf_vars_template}} {{ovmf_vars}}
    esac

# Run EFI VM
run-efi-vm:
    du -BM {{vm_checkout_root}}/{{vm_artifact_image}}/disk.img
    {{qemu}} \
        {{qemu_common_args}} \
        {{qemu_efi_args}} \
        {{qemu_arch_args}} \
        -drive file={{vm_checkout_root}}/{{vm_artifact_image}}/disk.img,format=raw,media=disk

ostree_config_file := 'ostree-config.yml'

# Set up OSTree repo (for example OSTree-based VM)
setup-ostree-vm: ostree-gpg
    echo 'ostree-remote-url: "http://{{local_address}}:8000/"' >"{{ostree_config_file}}.tmp"
    echo 'ostree-branch: "{{ostree_branch}}"' >>"{{ostree_config_file}}.tmp"
    mv "{{ostree_config_file}}.tmp" "{{ostree_config_file}}"

# Update OSTree repo with the latest artifact from `elements/vm/minimal-ostree/repo.bst`
#
# You must run `setup-ostree` once before using this target.
update-ostree:
    env bst="{{bst}}" utils/update-repo.sh        \
      --gpg-homedir=ostree-gpg            \
      --gpg-sign=$(cat ostree-gpg/default-id)    \
      --collection-id=org.freedesktop.Sdk        \
      ostree-repo vm/minimal-ostree/repo.bst    \
      {{ostree_branch}}

# Alias for update-ostree
ostree-repo: update-ostree

# Serve the OSTree example VM over HTTP, so an existing VM can pull updates.
ostree-serve: ostree-repo
    utils/run-local-repo.sh

# Build the OSTree example VM.
build-ostree-vm:
    {{bst}} build vm/minimal-ostree/image.bst

ostree_vm_disk := vm_checkout_root / 'ostree-vm/disk.img'

# Fetch/pull and check out the OSTree example VM.
[script]
export-ostree-vm: build-ostree-vm
    {{bst}} artifact checkout vm/minimal-ostree/image.bst --directory {{parent_dir(ostree_vm_disk)}}
    case {{arch}} in
    aarch64|x86_64)
        echo "Checking out firmware variables"
        {{bst}} build components/_private/ovmf.bst
        {{bst}} artifact checkout components/_private/ovmf.bst --directory {{vm_checkout_root}}/ovmf
        cp {{ovmf_vars_template}} {{ovmf_vars}}
    esac

# Run the OSTree example VM.
run-ostree-vm:
    du -BM {{ostree_vm_disk}}
    {{qemu}}                            \
        {{qemu_common_args}}                    \
        {{qemu_efi_args}}                    \
        {{qemu_net_args}}                    \
        {{qemu_arch_args}}                    \
        -drive file={{ostree_vm_disk}},format=raw,media=disk

# Clean up OSTree VM files.
clean-ostree-vm:
    rm -rf {{vm_checkout_root}}/ostree-vm
    rm -rf {{vm_checkout_root}}/ovmf
    rm -rf {{ovmf_vars}}
    rm -rf ./ostree-gpg

key_types := 'PK KEK DB VENDOR linux-module-cert'
all_certs := prepend('files/boot-keys/', append('.crt', key_types))
all_keys := prepend('files/boot-keys/', append('.key', key_types))

# Generate local UEFI Secure Boot keys for use with example Secure Boot VM.
[script]
generate_keys:
    mkdir -p files/boot-keys/extra-db
    touch files/boot-keys/extra-db/.keep
    mkdir -p files/boot-keys/extra-kek
    touch files/boot-keys/extra-kek/.keep
    for key_type in {{key_types}}; do
        openssl req -new -x509 -newkey rsa:2048 -subj "/CN=Freedesktop SDK ${key_type} key/" -keyout "files/boot-keys/${key_type}.key" -out "files/boot-keys/${key_type}.crt" -days 3650 -nodes -sha256
    done
    cp files/boot-keys/linux-module-cert.crt files/boot-keys/modules/linux-module-cert.crt

# Dowload Microsoft UEFI Secure Boot certificates.
#
# This is optional. It's useful if you want to setup a firmware that can boot
# other operating systems in addition to your locally built OS.
download-microsoft-keys:
    curl https://www.microsoft.com/pkiops/certs/MicCorUEFCA2011_2011-06-27.crt | openssl x509 -inform der -outform pem >files/boot-keys/extra-kek/mic-kek.crt
    echo 77fa9abd-0359-4d32-bd60-28f4e78f784b >files/boot-keys/extra-kek/mic-kek.owner
    curl https://www.microsoft.com/pkiops/certs/MicCorUEFCA2011_2011-06-27.crt | openssl x509 -inform der -outform pem >files/boot-keys/extra-db/mic-other.crt
    echo 77fa9abd-0359-4d32-bd60-28f4e78f784b >files/boot-keys/extra-db/mic-other.owner
    curl https://www.microsoft.com/pkiops/certs/MicWinProPCA2011_2011-10-19.crt | openssl x509 -inform der -outform pem >files/boot-keys/extra-db/mic-win.crt
    echo 77fa9abd-0359-4d32-bd60-28f4e78f784b >files/boot-keys/extra-db/mic-win.owner

secure_vm_version_file := 'secure-version.yml'
secure_vm_disk := vm_checkout_root / 'secure-vm/disk.img'

# Setup the Secure Boot VM ready to build.
setup-secure-vm: generate_keys
    #!/bin/bash
    set -eux
    tag={{last_version}} && \
    suffix=${tag#freedesktop-sdk-} && \
    echo "sdk-version: ${suffix}" >{{secure_vm_version_file}}

# Build the Secure Boot example VM.
build-secure-vm:
    {{bst}} -o prod_keys true build vm/minimal-secure/efi.bst

# Export the example Secure Boot VM.
[script]
export-secure-vm: build-secure-vm
    {{bst}} -o prod_keys true artifact checkout vm/minimal-secure/efi.bst --directory {{parent_dir(secure_vm_disk)}}
    truncate --size=+10G {{secure_vm_disk}}
    case {{arch}} in
    aarch64|x86_64)
        echo "Checking out firmware variables"
        {{bst}} build components/_private/ovmf.bst
        {{bst}} artifact checkout components/_private/ovmf.bst --directory {{vm_checkout_root}}/ovmf
        cp {{ovmf_vars_template}} {{ovmf_vars}}
    esac

# Run the Secure Boot VM.
[script]
run-secure-vm:
    du -BM {{secure_vm_disk}}
    mkdir -p {{vm_checkout_root}}/tpm/state
    swtpm socket \
        --tpm2 \
        --tpmstate dir={{absolute_path(vm_checkout_root / 'tpm/state')}} \
        --ctrl type=unixio,path={{absolute_path(vm_checkout_root / 'tpm/sock')}} \
        --log file=swtpm.log,level=20 & \
    sleep 1; \
    {{qemu}} \
        {{qemu_common_args}} \
        {{qemu_efi_args}} \
        {{qemu_net_args}} \
        {{qemu_tpm_args}} \
        {{qemu_arch_args}} \
        -drive file={{secure_vm_disk}},format=raw,media=disk

# Remove artifacts for the Secure Boot example VM.
clean-secure-vm:
    rm -rf {{vm_checkout_root}}/secure-vm
    rm -rf {{ovmf_vars}}
    rm -rf {{vm_checkout_root}}/ovmf
    rm -rf {{vm_checkout_root}}/TPM

# Export a new Secure Boot system image for use with systemd-sysupdate.
export-secure-images:
    rm -rf secure-images.tmp
    {{bst}} artifact checkout vm/minimal-secure/export.bst --directory secure-images.tmp
    [ -d secure-images ] || mkdir secure-images
    cp secure-images.tmp/usr_*.squashfs.xz secure-images
    cp secure-images.tmp/usr_*.verity.xz secure-images
    cp secure-images.tmp/freedesktopsdk_*.efi.xz secure-images
    (cd secure-images && sha256sum *.xz) >secure-images.tmp/SHA256SUMS
    cp secure-images.tmp/SHA256SUMS secure-images/SHA256SUMS

# Serve the exported Secure Boot images over HTTP for use with systemd-sysupdate.
#
# You must run `export-secure-images` target first.
secure-images-serve:
    python3 -m http.server 8080 --directory secure-images
