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
- kind: git_tag
  url: savannah:dmidecode.git
  track: master
  ref: dmidecode-3-5-0-g484f8935b0fc768841f43fa388b191196b5e12fd
