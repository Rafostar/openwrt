#
# Copyright (C) 2020 Rafostar
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

DVB_MENU:=DVB Core Support

define AddDepends/dvb
  SUBMENU:=$(DVB_MENU)
  DEPENDS+=+kmod-dvb-core $(1)
endef

define KernelPackage/dvb-core
  SUBMENU:=$(DVB_MENU)
  TITLE:=Support for DVB
  KCONFIG:= \
	CONFIG_DVB_CORE \
	CONFIG_MEDIA_SUPPORT=m \
	CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y \
	CONFIG_DVB_NET=y \
	CONFIG_DVB_MAX_ADAPTERS=8
  FILES:=$(LINUX_DIR)/drivers/media/dvb-core/dvb-core.ko
  AUTOLOAD:=$(call AutoProbe,dvb-core)
endef

define KernelPackage/dvb-core/description
  Enables the DVB API, used by Digital TV devices. Supports several
  standards, including DVB, ATSC, ISDB and CMDB.
endef

$(eval $(call KernelPackage,dvb-core))
