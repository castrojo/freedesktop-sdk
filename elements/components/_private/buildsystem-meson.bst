kind: stack

(@): elements/include/meson-stack-common.yml

description: |
    Private counterpart to public-stacks/buildsystem-meson.bst. This
    should only be used to break the circular dependencies, otherwise
    use the public stack.

depends:
  (>):
  - components/_private/git-minimal.bst
