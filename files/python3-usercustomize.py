import sys
import site
import os

try:
    getusersitepackages = site.getusersitepackages
except AttributeError:
    # Probably virtualenv. Don't do anything
    pass
else:
    old_user_site = getusersitepackages()
    site.USER_BASE = os.environ.get("PYTHONUSERBASE", "/var/data/python")
    site.USER_SITE = None
    site.USER_SITE = getusersitepackages()
    sys.path = [item for item in sys.path if not item.startswith(old_user_site)]
    site.addusersitepackages(site.removeduppaths())
