#
# Copyright (C) 2020 Rafostar
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

RC_MENU:=Remote Controllers Support

define AddDepends/rc
  SUBMENU:=$(RC_MENU)
  DEPENDS+=+kmod-rc-core $(1)
endef

define KernelPackage/rc-core
  SUBMENU:=$(RC_MENU)
  TITLE:=Support for Remote Controllers
  DEPENDS:=+kmod-input-core
  KCONFIG:=CONFIG_RC_CORE
  FILES:=$(LINUX_DIR)/drivers/media/rc/rc-core.ko
  AUTOLOAD:=$(call AutoProbe,rc-core)
endef

define KernelPackage/rc-core/description
  Enable support for Remote Controllers on Linux. This is
  needed in order to support several video capture adapters,
  standalone IR receivers/transmitters, and RF receivers.

  Enable this option if you have a video capture board even
  if you don't need IR, as otherwise, you may not be able to
  compile the driver for your adapter.
endef

$(eval $(call KernelPackage,rc-core))
