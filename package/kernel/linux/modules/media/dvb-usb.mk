#
# Copyright (C) 2020 Rafostar
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Depending on device manufacturer/revision different tuners and demodulators are used.
# Either check what your device requires on https://www.linuxtv.org
# or if you are not restricted by free space compile with modules for all known
# possible variants used in your specific DVB device. Each device requires a firmware.
#

DVB_USB_MENU:=DVB USB Devices

#
# USB DVB dependencies required to build some of below packages
#

define SetDvbUsbDepend
  SUBMENU:=$(DVB_USB_MENU)
  #HIDDEN:=1
  FILES:=$(LINUX_DIR)/drivers/media/dvb-frontends/$1.ko
  AUTOLOAD:=$(call AutoProbe,$1)
endef


define KernelPackage/dvb-usb-dibusb-common
  TITLE:=Common library for DVB DIB USB drivers
  $(call SetDvbUsbDepend,dvb-usb-dibusb-common)
endef

$(eval $(call KernelPackage,dvb-usb-dibusb-common))

#
# USB DVB devices
#

define KernelPackage/dvb-usb
  SUBMENU:=$(DVB_USB_MENU)
  TITLE:=Support for various USB DVB devices
  DEPENDS:= \
	+kmod-dvb-core \
	+kmod-usb-core \
	+kmod-i2c-core \
	+kmod-rc-core
  KCONFIG:= \
	CONFIG_DVB_USB \
	CONFIG_MEDIA_USB_SUPPORT=y
  FILES:=$(LINUX_DIR)/drivers/media/usb/dvb-usb/dvb-usb.ko
  AUTOLOAD:=$(call AutoProbe,dvb-usb)
endef

define KernelPackage/rc-core/description
  By enabling this you will be able to choose the various supported
  USB1.1 and USB2.0 DVB devices.
endef

$(eval $(call KernelPackage,dvb-usb))


define KernelPackage/dvb-usb-dib0700
  SUBMENU:=$(DVB_USB_MENU)
  TITLE:=Support for DiBcom DiB0700 USB DVB devices
  DEPENDS:= \
	+kmod-dvb-usb \
	+PACKAGE_kmod-dvb-tuner-dib0070:kmod-dvb-tuner-dib0070 \
	+PACKAGE_kmod-dvb-tuner-dib0090:kmod-dvb-tuner-dib0090 \
	+PACKAGE_kmod-dvb-dib3000mc:kmod-dvb-dib3000mc \
	+PACKAGE_kmod-dvb-dib7000m:kmod-dvb-dib7000m \
	+PACKAGE_kmod-dvb-dib7000p:kmod-dvb-dib7000p \
	+PACKAGE_kmod-dvb-dib8000:kmod-dvb-dib8000
  KCONFIG:=CONFIG_DVB_USB_DIB0700
  FILES:=$(LINUX_DIR)/drivers/media/usb/dvb-usb/dvb-usb-dib0700.ko
  AUTOLOAD:=$(call AutoProbe,dvb-usb-dib0700)
endef

define KernelPackage/rc-core/description
  Support for USB2.0/1.1 DVB receivers based on the DiB0700 USB bridge. The
  USB bridge is also present in devices having the DiB7700 DVB-T-USB
  silicon. This chip can be found in devices offered by Hauppauge,
  Avermedia and other big and small companies.

  For an up-to-date list of devices supported by this driver, have a look
  on the LinuxTV Wiki at www.linuxtv.org.
endef

$(eval $(call KernelPackage,dvb-usb-dib0700))


define KernelPackage/dvb-usb-dib3000mc
  SUBMENU:=$(DVB_USB_MENU)
  TITLE:=Allows accessing DIB3000MC from USB
  DEPENDS:= \
	+kmod-dvb-usb \
	+kmod-dvb-dib3000mc
  KCONFIG:=DVB_USB_DIB3000MC
  AUTOLOAD:=$(call AutoProbe,dvb-usb-dib3000mc)
endef

define KernelPackage/dvb-usb-dib3000mc/description
  This is a module with helper functions for accessing the
  DIB3000MC from USB DVB devices.

  It must be a separate module in case
  DVB_USB is built-in and DVB_DIB3000MC is a module.
endef

$(eval $(call KernelPackage,dvb-usb-dib3000mc))
