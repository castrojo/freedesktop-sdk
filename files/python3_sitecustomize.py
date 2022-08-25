import sysconfig
import site

fmt = "/app/{platlibdir}/python{py_version_short}/site-packages"
site.addsitedir(fmt.format(**sysconfig.get_config_vars()))
