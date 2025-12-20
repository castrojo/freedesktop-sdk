kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    sbindir="%{sbindir}"
    mandir="%{mandir}"
  make: make %{make-args}
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install

sources:
- kind: git_repo
  url: savannah:dmidecode.git
  track: dmidecode-*
  ref: dmidecode-3-7-0-g21a2ee3ff73e71875d171ed1b9b851afa27aa90b
