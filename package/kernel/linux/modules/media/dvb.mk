#
# Copyright (C) 2020 Rafostar
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

MEDIA_MENU:=Multimedia Support

define AddDepends/dvb
  SUBMENU:=$(MEDIA_MENU)
  DEPENDS+=+kmod-dvb-core $(1)
endef

define KernelPackage/dvb-core
  SUBMENU:=$(MEDIA_MENU)
  TITLE:=Support for DVB
  KCONFIG:= \
	CONFIG_DVB_CORE \
	CONFIG_MEDIA_SUPPORT=y \
	CONFIG_MEDIA_SUPPORT_FILTER=n \
	CONFIG_DVB_MAX_ADAPTERS=8
  FILES:=$(LINUX_DIR)/drivers/media/dvb-core/dvb-core.ko
  AUTOLOAD:=$(call AutoProbe,dvb-core)
endef

define KernelPackage/dvb-core/description
 Kernel support for DVB
endef

$(eval $(call KernelPackage,dvb-core))
