################################################################################
#
# open-lldp
#
################################################################################

OPEN_LLDP_VERSION = 036e314bd93602f7388262cc37faf8b626980af1
OPEN_LLDP_SITE = git://open-lldp.org/open-lldp.git
OPEN_LLDP_DEPENDENCIES = readline libnl libconfig host-pkgconf
OPEN_LLDP_LICENSE = GPL-2.0
OPEN_LLDP_LICENSE_FILES = COPYING

# Fetching from git, need to generate configure/Makefile.in
OPEN_LLDP_AUTORECONF = YES

# Create the m4 directory (missing from the archive).
# This is required for autoconf.
define OPEN_LLDP_CREATE_M4
	mkdir -p $(@D)/m4
endef

OPEN_LLDP_PRE_CONFIGURE_HOOKS += OPEN_LLDP_CREATE_M4

$(eval $(autotools-package))
