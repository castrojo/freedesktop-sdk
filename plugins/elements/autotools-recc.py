from buildstream import BuildElement


class AutotoolsRECCElement(BuildElement):
    BST_MIN_VERSION = "2.6"


def setup():
    return AutotoolsRECCElement
