# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

all:
	install -m 0755 -d $(INSTALL_ROOT)/usr/share/fonts/$(NAME)
	install -p -m 644 $(TTFDIR)*.ttf  $(INSTALL_ROOT)/usr/share/fonts/$(NAME)
	install -m 0755 -d $(INSTALL_ROOT)/usr/share/fontconfig/conf.avail $(INSTALL_ROOT)/etc/fonts/conf.d
	for f in $(FAMILIES) ; do \
		if [ "x$(SRCPRIO)" == "x" ] ; then \
			FILE=$(NAME)-$$f.conf; \
		else \
			FILE=$(SRCPRIO)-$(NAME)-$$f.conf; \
		fi; \
		install -m 0644 -p $(CONFDIR)$$FILE $(INSTALL_ROOT)/usr/share/fontconfig/conf.avail/$(PRIO)-$$FILE; \
		ln -s $(INSTALL_ROOT)/usr/share/fontconfig/conf.avail/$(PRIO)-$$FILE $(INSTALL_ROOT)/etc/fonts/conf.d/$(PRIO)-$$FILE; \
	done
	if [ "x$(FAMILIES)" == "x" ] ; then \
		FILE=$(NAME).conf; \
		install -m 0644 -p $(CONFDIR)$$FILE $(INSTALL_ROOT)/usr/share/fontconfig/conf.avail/$(PRIO)-$$FILE; \
		ln -s $(INSTALL_ROOT)/usr/share/fontconfig/conf.avail/$(PRIO)-$$FILE $(INSTALL_ROOT)/etc/fonts/conf.d/$(PRIO)-$$FILE; \
	fi
	for f in $(EXTRA_CONFS) ; do \
		install -m 0644 -p $(CONFDIR)$$f $(INSTALL_ROOT)/usr/share/fontconfig/conf.avail/$$f; \
		ln -s $(INSTALL_ROOT)/usr/share/fontconfig/conf.avail/$$f $(INSTALL_ROOT)/etc/fonts/conf.d/$$f; \
	done

install:
	true
