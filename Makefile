SHELL=/bin/bash
BRANCH=23.08
ARCH?=$(shell uname -m | sed "s/^i.86$$/i686/")
BOOTSTRAP_ARCH?=$(shell uname -m | sed "s/^i.86$$/i686/")
ifeq ($(ARCH),i686)
FLATPAK_ARCH=i386
QEMU_ARCH=i386
else ifeq ($(ARCH),ppc64le)
FLATPAK_ARCH=ppc64le
QEMU_ARCH=ppc64
else
FLATPAK_ARCH=$(ARCH)
QEMU_ARCH=$(ARCH)
endif
REPO=repo
CHECKOUT_ROOT=runtimes
VM_CHECKOUT_ROOT=checkout/$(ARCH)
VM_ARTIFACT_FILESYSTEM?=vm/minimal/virt.bst
VM_ARTIFACT_BOOT?=vm/boot/virt.bst
VM_ARTIFACT_IMAGE?=vm/minimal/efi.bst
RUNTIME_VERSION?=master
ifeq ($(RUNTIME_VERSION),master)
TARGET_BRANCH=master
else
TARGET_BRANCH=release/$(RUNTIME_VERSION)
endif

SNAP_GRADE?=devel
ARCH_OPTS=-o bootstrap_build_arch $(BOOTSTRAP_ARCH) -o target_arch $(ARCH) -o snap_grade $(SNAP_GRADE)
TARBALLS=            \
	sdk          \
	platform
TAR_ELEMENTS=$(addprefix tarballs/,$(addsuffix .bst,$(TARBALLS)))
TAR_CHECKOUT_ROOT=tarballs

ifeq ($(ARCH),arm)
ABI=gnueabi
else
ABI=gnu
endif

BST=bst --colors $(ARCH_OPTS)
QEMU=qemu-system-$(QEMU_ARCH)

all: build

build:
	$(BST) build tests/check-platform.bst \
	             tests/check-sdk.bst \
	             components.bst \
	             flatpak-release-repo.bst \
	             public-stacks/buildsystems.bst \
	             oci/layers/{bootstrap,debug,platform,sdk,flatpak}.bst


build-tar:
	$(BST) build $(TAR_ELEMENTS)


bootstrap:
	$(BST) build bootstrap/bootstrap.bst

export: clean-runtime
	$(BST) build flatpak-release-repo.bst

	mkdir -p $(CHECKOUT_ROOT)
	$(BST) artifact checkout flatpak-release-repo.bst --directory $(CHECKOUT_ROOT)/flatpak-release-repo.bst

	test -e $(REPO) || ostree init --repo=$(REPO) --mode=archive

	flatpak build-commit-from --src-repo=$(CHECKOUT_ROOT)/flatpak-release-repo.bst $(REPO)

	rm -rf $(CHECKOUT_ROOT)

$(REPO): export

export-tar: build-tar
	rm -rf $(TAR_CHECKOUT_ROOT)
	mkdir -p $(TAR_CHECKOUT_ROOT)
	set -e; for tarball in $(TARBALLS); do \
		dir="$(ARCH)-$${tarball}"; \
		mkdir -p "$(TAR_CHECKOUT_ROOT)/$${dir}"; \
		$(BST) artifact checkout "tarballs/$${tarball}.bst" --tar - | xz -T0 > "$(TAR_CHECKOUT_ROOT)/$${dir}/freedesktop-$${tarball}-$(ARCH).tar.xz"; \
	done

clean-vm:
	rm -rf $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_FILESYSTEM)
	rm -rf $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)
	rm -rf $(OVMF_VARS)

OVMF_VARS=$(VM_CHECKOUT_ROOT)/efi_vars.fd
ifeq ($(ARCH),aarch64)
OVMF_VARS_TEMPLATE=$(VM_CHECKOUT_ROOT)/ovmf/usr/share/ovmf/QEMU_VARS.fd
OVMF_CODE=$(VM_CHECKOUT_ROOT)/ovmf/usr/share/ovmf/QEMU_EFI.fd
else
OVMF_VARS_TEMPLATE=$(VM_CHECKOUT_ROOT)/ovmf/usr/share/ovmf/OVMF_VARS.fd
OVMF_CODE=$(VM_CHECKOUT_ROOT)/ovmf/usr/share/ovmf/OVMF_CODE.fd
endif

$(OVMF_VARS_TEMPLATE) $(OVMF_CODE):
	$(BST) build components/ovmf.bst
	$(BST) artifact checkout components/ovmf.bst --directory $(VM_CHECKOUT_ROOT)/ovmf

$(OVMF_VARS): $(OVMF_VARS_TEMPLATE)
	cp "$<" "$@"

$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_FILESYSTEM)/usr/lib/os-release:
	$(BST) artifact checkout $(VM_ARTIFACT_FILESYSTEM) --directory $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_FILESYSTEM)

$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)/vmlinuz:
	$(BST) artifact checkout $(VM_ARTIFACT_BOOT) --directory $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)

build-vm:
	$(BST) build $(VM_ARTIFACT_FILESYSTEM) $(VM_ARTIFACT_BOOT)

QEMU_COMMON_ARGS=										\
	-m 2G											\
	-smp 4											\
	-object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0	\
	-nographic

QEMU_VIRTFS_ARGS=													\
	-kernel $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)/vmlinuz								\
	-initrd $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)/initramfs.gz							\
	-virtfs local,id=virtfs,path=$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_FILESYSTEM),security_model=none,mount_tag=virtfs

QEMU_EFI_ARGS=									\
	-drive if=pflash,format=raw,unit=0,file=$(OVMF_CODE),readonly=on	\
	-drive if=pflash,format=raw,unit=1,file=$(OVMF_VARS)

QEMU_NET_ARGS=							\
	-netdev user,id=net1 -device virtio-net,netdev=net1

QEMU_TPM_ARGS =									\
	-chardev socket,id=chrtpm,path=$(abspath $(VM_CHECKOUT_ROOT)/tpm/sock)	\
	-tpmdev emulator,id=tpm0,chardev=chrtpm					\
	-device tpm-tis,tpmdev=tpm0

ifeq ($(ARCH),x86_64)
run-vm: $(OVMF_CODE) $(OVMF_VARS)

QEMU_COMMON_ARGS+=				\
	-M q35,accel=kvm
QEMU_VIRTFS_ARGS+=												\
	-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap console=ttyS0'	\
	$(QEMU_EFI_ARGS)
else ifeq ($(ARCH),aarch64)
run-vm: $(OVMF_CODE) $(OVMF_VARS)

QEMU_COMMON_ARGS+=				\
	-machine type=virt,accel=kvm		\
	-cpu max
QEMU_VIRTFS_ARGS+=																\
	-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap init=/usr/lib/systemd/systemd console=ttyAMA0'	\
	$(QEMU_EFI_ARGS)
else ifeq ($(ARCH),ppc64le)
QEMU_COMMON_ARGS+=				\
	-machine pseries
QEMU_VIRTFS_ARGS+=																\
	-append 'root=virtfs rw rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=mmap init=/usr/lib/systemd/systemd console=ttyS0'
endif

run-vm: build-vm $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_BOOT)/vmlinuz $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_FILESYSTEM)/usr/lib/os-release
	unshare --map-root-user $(QEMU) $(QEMU_COMMON_ARGS) $(QEMU_VIRTFS_ARGS)

check-abi:
	$(BST) build tests/check-abi.bst; \
	exit_code="$$?"; \
	if [ "$${CI}" = "true" ]; then \
		mv $${XDG_CACHE_HOME}/buildstream/build/tests-check-abi-*/root/libabigail-tars .; \
	fi; \
	exit $${exit_code}

check-debuginfo:
	$(BST) build tests/check-debuginfo.bst

check-dev-files:
	$(BST) build tests/check-dev-files.bst

check-rpath:
	$(BST) build tests/check-rpath.bst

check-static-libraries:
	$(BST) build tests/check-static-libraries.bst

manifest:
	rm -rf sdk-manifest/
	rm -rf platform-manifest/

	$(BST) build manifests/platform-manifest.bst manifests/sdk-manifest.bst

	$(BST) artifact checkout manifests/platform-manifest.bst --directory platform-manifest/
	$(BST) artifact checkout manifests/sdk-manifest.bst --directory sdk-manifest/

markdown-manifest: manifest
	python3 utils/jsontomd.py platform-manifest/usr/manifest.json
	python3 utils/jsontomd.py sdk-manifest/usr/manifest.json

url-manifest:
	python3 utils/url_manifest.py release-url-manifest/url-manifest-no-mirrors.json \
	  flatpak-release-repo.bst components.bst \
	  components/rust-stage1-x86_64.bst components/rust-stage1-i686.bst components/rust-stage1-aarch64.bst \
	  components/rust-stage1-armv7.bst components/rust-stage1-powerpc64le.bst \
	  oci/layers/flatpak.bst oci/layers/debug.bst oci/layers/platform.bst oci/layers/sdk.bst

test-apps: export XDG_DATA_HOME=$(CURDIR)/runtime
test-apps: $(REPO)
	echo $(XDG_DATA_HOME)
	mkdir -p runtime
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak remote-ls --all fdo-sdk-test-repo --columns ref,download-size,installed-size | awk "/$(FLATPAK_ARCH)/ && /$(BRANCH)/"
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk}//$(BRANCH)
	flatpak list

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.flatpak.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.gnu.Hello.json
	flatpak-builder --arch=$(FLATPAK_ARCH) --run app tests/org.gnu.Hello.json hello

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.Readline.json

test-codecs: export XDG_DATA_HOME=$(CURDIR)/runtime
test-codecs: $(REPO)
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk}//$(BRANCH)

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean --repo=$(REPO) app tests/test.codecs.no-exts.json

	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean --repo=$(REPO) app tests/test.codecs.ffmpeg-full.json

	# Expect full codecs
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo test.codecs.ffmpeg-full
	flatpak run test.codecs.ffmpeg-full

	# Expect default codecs
	flatpak run test.codecs.no-exts

	flatpak uninstall -y --all

test-runtime-inheritance: export XDG_DATA_HOME=$(CURDIR)/runtime
test-runtime-inheritance: $(REPO)
	flatpak remote-add --if-not-exists --user --no-gpg-verify fdo-sdk-test-repo $(REPO)
	flatpak install -y --arch=$(FLATPAK_ARCH) --user fdo-sdk-test-repo org.freedesktop.{Platform,Sdk{,.Debug,.Docs,.Locale}}//$(BRANCH)
	flatpak-builder --arch=$(FLATPAK_ARCH) --force-clean app tests/org.flatpak.ExampleRuntime.json


clean-repo:
	rm -rf $(REPO)

clean-runtime:
	rm -rf $(CHECKOUT_ROOT)

clean-test:
	rm -rf app/
	rm -rf .flatpak-builder/
	rm -rf runtime/

clean: clean-repo clean-runtime clean-test clean-vm clean-efi-vm

export-snap:
	bst --colors $(ARCH_OPTS) build "snap-images/images.bst"
	bst --colors $(ARCH_OPTS) artifact checkout "snap-images/images.bst" --directory snap/

export-oci:
	$(BST) build oci/platform-oci.bst \
	             oci/sdk-oci.bst \
	             oci/debug-oci.bst \
	             oci/flatpak-oci.bst \
	             oci/toolbox-oci.bst
	set -e; \
	for name in platform sdk debug flatpak toolbox; do \
	  $(BST) artifact checkout "oci/$${name}-oci.bst" --tar "$${name}-oci.tar"; \
	done

export-docker:
	$(BST) build oci/platform-docker.bst \
	             oci/sdk-docker.bst \
	             oci/debug-docker.bst \
	             oci/flatpak-docker.bst \
	             oci/toolbox-docker.bst
	set -e; \
	for name in platform sdk debug flatpak toolbox; do \
	  $(BST) artifact checkout "oci/$${name}-docker.bst" --tar "$${name}-docker.tar"; \
	done

track-mesa-git:
	$(BST) source track extensions/mesa-git/libdrm.bst
	$(BST) source track extensions/mesa-git/mesa.bst

define OSTREE_GPG_CONFIG
Key-Type: DSA
Key-Length: 1024
Subkey-Type: ELG-E
Subkey-Length: 1024
Name-Real: OSTree Freedesktop SDK TEST
Expire-Date: 0
%no-protection
%commit
%echo finished
endef

export OSTREE_GPG_CONFIG
ostree-gpg:
	rm -rf ostree-gpg.tmp
	mkdir ostree-gpg.tmp
	chmod 0700 ostree-gpg.tmp
	echo "$${OSTREE_GPG_CONFIG}" >ostree-gpg.tmp/key-config
	gpg --batch --homedir=ostree-gpg.tmp --generate-key ostree-gpg.tmp/key-config
	gpg --homedir=ostree-gpg.tmp -k --with-colons | sed '/^fpr:/q;d' | cut -d: -f10 >ostree-gpg.tmp/default-id
	mv ostree-gpg.tmp ostree-gpg

files/vm/ostree-config/fdsdk.gpg: ostree-gpg
	gpg --homedir=ostree-gpg --export --armor >"$@"

LOCAL_ADDRESS=$(shell ip route get 1.1.1.1 | cut -d" " -f7)
OSTREE_BRANCH=freedesktop-sdk/minimal/$(BRANCH)/$(ARCH)

.PHONY: vulkan-stack-update
vulkan-stack-update:
	bst source track components/vulkan-icd-loader.bst \
	components/vulkan-headers.bst \
	components/vulkan-validation-layers.bst \
	extensions/vulkaninfo/vulkan-tools.bst \
	components/spirv-headers.bst \
	components/spirv-tools.bst \
	components/glslang.bst

$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_IMAGE)/disk.img:
	$(BST) artifact checkout $(VM_ARTIFACT_IMAGE) --directory $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_IMAGE)

clean-efi-vm:
	rm -rf $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_IMAGE)
	rm -rf $(OVMF_VARS)

build-efi-vm:
	$(BST) build $(VM_ARTIFACT_IMAGE)

run-efi-vm: build-efi-vm $(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_IMAGE)/disk.img $(OVMF_VARS) $(OVMF_CODE)
	$(QEMU)							\
	    $(QEMU_COMMON_ARGS)					\
	    $(QEMU_EFI_ARGS)					\
	    -drive file=$(VM_CHECKOUT_ROOT)/$(VM_ARTIFACT_IMAGE)/disk.img,format=raw,media=disk

ostree-config.yml:
	echo 'ostree-remote-url: "http://$(LOCAL_ADDRESS):8000/"' >"$@.tmp"
	echo 'ostree-branch: "$(OSTREE_BRANCH)"' >>"$@.tmp"
	mv "$@.tmp" "$@"

update-ostree: ostree-gpg ostree-config.yml files/vm/ostree-config/fdsdk.gpg
	env BST="$(BST)" utils/update-repo.sh		\
	  --gpg-homedir=ostree-gpg			\
	  --gpg-sign=$$(cat ostree-gpg/default-id)	\
	  --collection-id=org.freedesktop.Sdk		\
	  ostree-repo vm/minimal-ostree/repo.bst	\
	  $(OSTREE_BRANCH)

ostree-repo:
	$(MAKE) update-ostree

ostree-serve: ostree-repo
	python3 -m http.server 8000 --directory ostree-repo

$(VM_CHECKOUT_ROOT)/ostree-vm/disk.img: files/vm/ostree-config/fdsdk.gpg ostree-config.yml
	$(BST) build vm/minimal-ostree/image.bst
	$(BST) artifact checkout vm/minimal-ostree/image.bst --directory $(dir $@)

run-ostree-vm: $(VM_CHECKOUT_ROOT)/ostree-vm/disk.img  $(OVMF_VARS) $(OVMF_CODE)
	$(QEMU)							\
	    $(QEMU_COMMON_ARGS)					\
	    $(QEMU_EFI_ARGS)					\
	    $(QEMU_NET_ARGS)					\
	    -drive file=$<,format=raw,media=disk

clean-ostree-vm:
	rm -rf $(VM_CHECKOUT_ROOT)/ostree-vm
	rm -rf $(OVMF_VARS)

KEY_TYPES=PK KEK DB VENDOR linux-module-cert
ALL_CERTS=$(foreach KEY,$(KEY_TYPES),files/boot-keys/$(KEY).crt)
ALL_KEYS=$(foreach KEY,$(KEY_TYPES),files/boot-keys/$(KEY).key)
BOOT_KEYS=$(ALL_KEYS) $(ALL_CERTS) files/boot-keys/extra-db/.keep files/boot-keys/extra-kek/.keep files/boot-keys/modules/linux-module-cert.crt

generate-keys: $(BOOT_KEYS)

files/boot-keys/extra-db/.keep files/boot-keys/extra-kek/.keep:
	[ -d $(dir $@) ] || mkdir -p $(dir $@)
	touch $@

files/boot-keys/modules/linux-module-cert.crt: files/boot-keys/linux-module-cert.crt
	cp $< $@

files/boot-keys/%.crt files/boot-keys/%.key:
	[ -d files/boot-keys ] || mkdir -p files/boot-keys
	openssl req -new -x509 -newkey rsa:2048 -subj "/CN=Freedesktop SDK $(basename $(notdir $@)) key/" -keyout "$(basename $@).key" -out "$(basename $@).crt" -days 3650 -nodes -sha256

# This is optional
download-microsoft-keys: files/boot-keys/extra-db/.keep files/boot-keys/extra-kek/.keep
	curl https://www.microsoft.com/pkiops/certs/MicCorUEFCA2011_2011-06-27.crt | openssl x509 -inform der -outform pem >files/boot-keys/extra-kek/mic-kek.crt
	echo 77fa9abd-0359-4d32-bd60-28f4e78f784b >files/boot-keys/extra-kek/mic-kek.owner
	curl https://www.microsoft.com/pkiops/certs/MicCorUEFCA2011_2011-06-27.crt | openssl x509 -inform der -outform pem >files/boot-keys/extra-db/mic-other.crt
	echo 77fa9abd-0359-4d32-bd60-28f4e78f784b >files/boot-keys/extra-db/mic-other.owner
	curl https://www.microsoft.com/pkiops/certs/MicWinProPCA2011_2011-10-19.crt | openssl x509 -inform der -outform pem >files/boot-keys/extra-db/mic-win.crt
	echo 77fa9abd-0359-4d32-bd60-28f4e78f784b >files/boot-keys/extra-db/mic-win.owner

$(VM_CHECKOUT_ROOT)/secure-vm/disk.img: $(BOOT_KEYS) secure-version.yml
	$(BST) build vm/minimal-secure/efi.bst
	$(BST) artifact checkout vm/minimal-secure/efi.bst --directory $(dir $@)
	truncate --size=+2G $@

run-secure-vm: $(VM_CHECKOUT_ROOT)/secure-vm/disk.img $(OVMF_VARS) $(OVMF_CODE)
	mkdir -p $(VM_CHECKOUT_ROOT)/tpm/state
	swtpm socket								\
		--tpm2								\
		--tpmstate dir=$(abspath $(VM_CHECKOUT_ROOT)/tpm/state)		\
		--ctrl type=unixio,path=$(abspath $(VM_CHECKOUT_ROOT)/tpm/sock)	\
		--log file=swtpm.log,level=20 &					\
	sleep 1;								\
	$(QEMU)									\
	    $(QEMU_COMMON_ARGS)							\
	    $(QEMU_EFI_ARGS)							\
	    $(QEMU_NET_ARGS)							\
	    $(QEMU_TPM_ARGS)							\
	    -drive file=$<,format=raw,media=disk

clean-secure-vm:
	rm -rf $(VM_CHECKOUT_ROOT)/secure-vm
	rm -rf $(OVMF_VARS)
	rm -rf $(VM_CHECKOUT_ROOT)/tpm

update-secure-version:
	describe=$$(git describe --tags) &&			\
	suffix=$${describe#freedesktop-sdk-} &&			\
	version=$${suffix%-g*} &&				\
	echo "sdk-version: $${version}" >secure-version.yml

secure-version.yml:
	$(MAKE) update-secure-version

export-secure-images: secure-version.yml
	$(BST) build vm/minimal-secure/export.bst
	rm -rf secure-images.tmp
	$(BST) artifact checkout vm/minimal-secure/export.bst --directory secure-images.tmp
	[ -d secure-images ] || mkdir secure-images
	cp secure-images.tmp/usr_*.squashfs.xz secure-images
	cp secure-images.tmp/usr_*.verity.xz secure-images
	cp secure-images.tmp/freedesktopsdk_*.efi.xz secure-images
	(cd secure-images && sha256sum *.xz) >secure-images.tmp/SHA256SUMS
	cp secure-images.tmp/SHA256SUMS secure-images/SHA256SUMS

secure-images/SHA256SUMS:
	$(MAKE) export-secure-images

secure-images-serve: secure-images/SHA256SUMS
	python3 -m http.server 8080 --directory secure-images

.PHONY:									\
	build check-dev-files clean clean-test clean-repo clean-runtime	\
	export test-apps manifest markdown-manifest check-rpath		\
	build-tar export-tar clean-vm build-vm run-vm export-snap	\
	export-oci export-docker bootstrap test-codecs			\
	track-mesa-git							\
	clean-efi-vm build-efi-vm run-efi-vm				\
	update-ostree ostree-serve run-ostree-vm			\
	test-runtime-inheritance generate-keys clean-ostree-vm		\
	download-microsoft-keys						\
	run-secure-vm clean-secure-vm clean-ostree-vm			\
	export-secure-images secure-images-serve update-secure-version
