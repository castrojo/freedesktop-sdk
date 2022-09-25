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
  ref: dmidecode-3-4-0-g7931f69f9367970f5920bf8239c77f6a5c1d57af
