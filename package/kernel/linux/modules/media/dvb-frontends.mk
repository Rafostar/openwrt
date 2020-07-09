#
# Copyright (C) 2020 Rafostar
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

MEDIA_MENU:=Multimedia Support

#
# DVB Frontend dependencies required by some of below packages
#

define SetFrontendDepend
  SUBMENU:=$(MEDIA_MENU)
  #HIDDEN:=1
  FILES:=$(LINUX_DIR)/drivers/media/dvb-frontends/$1.ko
  AUTOLOAD:=$(call AutoProbe,$1)
endef

define KernelPackage/dvb-dibx000-common
  TITLE:=Common library for DIBX000 drivers
  $(call SetFrontendDepend,dibx000_common)
endef

$(eval $(call KernelPackage,dvb-dibx000-common))

#
# DVB Frontend drivers
#

define SetFrontend
  SUBMENU:=$(MEDIA_MENU)
  #HIDDEN:=1
  KCONFIG:=$2
  DEPENDS:=+kmod-dvb-core +kmod-i2c-core $(3)
  FILES:=$(LINUX_DIR)/drivers/media/dvb-frontends/$1.ko
  AUTOLOAD:=$(call AutoProbe,$1)
endef

define KernelPackage/dvb-stb0899
  TITLE:=STB0899 based
  $(call SetFrontend,stb0899,CONFIG_DVB_STB0899)
endef

define KernelPackage/dvb-stb0899/description
 A DVB-S/S2/DSS Multistandard demodulator. Say Y when you want
 to support this demodulator based frontends
endef

$(eval $(call KernelPackage,dvb-stb0899))

define KernelPackage/dvb-stb6100
  TITLE:=STB6100 based tuners
  $(call SetFrontend,stb6100,CONFIG_DVB_STB6100)
endef

define KernelPackage/dvb-stb6100/description
 A Silicon tuner from ST used in conjunction with the STB0899
 demodulator. Say Y when you want to support this tuner.
endef

$(eval $(call KernelPackage,dvb-stb6100))

define KernelPackage/dvb-stv090x
  TITLE:=STV0900/STV0903(A/B) based
  $(call SetFrontend,stv090x,CONFIG_DVB_STV090x)
endef

define KernelPackage/dvb-stv090x/description
 DVB-S/S2/DSS Multistandard Professional/Broadcast demodulators.
 Say Y when you want to support these frontends.
endef

$(eval $(call KernelPackage,dvb-stv090x))

define KernelPackage/dvb-stv0910
  TITLE:=STV0910 based
  $(call SetFrontend,stv0910,CONFIG_DVB_STV0910)
endef

define KernelPackage/dvb-stv0910/description
 ST STV0910 DVB-S/S2 demodulator driver.
endef

$(eval $(call KernelPackage,dvb-stv0910))

define KernelPackage/dvb-stv6110x
  TITLE:=STV6110/(A) based tuners
  $(call SetFrontend,stv6110x,CONFIG_DVB_STV6110x)
endef

define KernelPackage/dvb-stv6110x/description
 A Silicon tuner that supports DVB-S and DVB-S2 modes
endef

$(eval $(call KernelPackage,dvb-stv6110x))

define KernelPackage/dvb-stv6111
  TITLE:=STV6111 based tuners
  $(call SetFrontend,stv6111,CONFIG_DVB_STV6111)
endef

define KernelPackage/dvb-stv6111/description
 A Silicon tuner that supports DVB-S and DVB-S2 modes
endef

$(eval $(call KernelPackage,dvb-stv6111))

define KernelPackage/dvb-mxl5xx
  TITLE:=MaxLinear MxL5xx based tuner-demodulators
  $(call SetFrontend,mxl5xx,CONFIG_DVB_MXL5XX)
endef

define KernelPackage/dvb-mxl5xx/description
 MaxLinear MxL5xx family of DVB-S/S2 tuners/demodulators.
endef

$(eval $(call KernelPackage,dvb-mxl5xx))

define KernelPackage/dvb-m88ds3103
  TITLE:=Montage Technology M88DS3103
  $(call SetFrontend,m88ds3103,CONFIG_DVB_M88DS3103)
endef

define KernelPackage/dvb-m88ds3103/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-m88ds3103))

define KernelPackage/dvb-drxk
  TITLE:=Micronas DRXK based
  $(call SetFrontend,drxk,CONFIG_DVB_DRXK)
endef

define KernelPackage/dvb-drxk/description
 Micronas DRX-K DVB-C/T demodulator.
endef

$(eval $(call KernelPackage,dvb-drxk))

define KernelPackage/dvb-tda18271c2dd
  TITLE:=NXP TDA18271C2 silicon tuner
  $(call SetFrontend,tda18271c2dd,CONFIG_DVB_TDA18271C2DD)
endef

define KernelPackage/dvb-tda18271c2dd/description
 NXP TDA18271 silicon tuner.
endef

$(eval $(call KernelPackage,dvb-tda18271c2dd))

define KernelPackage/dvb-si2165
  TITLE:=Silicon Labs si2165 based
  $(call SetFrontend,si2165,CONFIG_DVB_SI2165)
endef

define KernelPackage/dvb-si2165/description
 A DVB-C/T demodulator.
endef

$(eval $(call KernelPackage,dvb-si2165))

define KernelPackage/dvb-mn88472
  TITLE:=Panasonic MN88472
  $(call SetFrontend,mn88472,CONFIG_DVB_MN88472)
endef

define KernelPackage/dvb-mn88472/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-mn88472))

define KernelPackage/dvb-mn88473
  TITLE:=Panasonic MN88473
  $(call SetFrontend,mn88473,CONFIG_DVB_MN88473)
endef

define KernelPackage/dvb-mn88473/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-mn88473))

define KernelPackage/dvb-cx24110
  TITLE:=Conexant CX24110 based
  $(call SetFrontend,cx24110,CONFIG_DVB_CX24110)
endef

define KernelPackage/dvb-cx24110/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-cx24110))

define KernelPackage/dvb-cx24123
  TITLE:=Conexant CX24123 based
  $(call SetFrontend,cx24123,CONFIG_DVB_CX24123)
endef

define KernelPackage/dvb-cx24123/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-cx24123))

define KernelPackage/dvb-mt312
  TITLE:=Zarlink VP310/MT312/ZL10313 based
  $(call SetFrontend,mt312,CONFIG_DVB_MT312)
endef

define KernelPackage/dvb-mt312/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-mt312))

define KernelPackage/dvb-zl10036
  TITLE:=Zarlink ZL10036 silicon tuner
  $(call SetFrontend,zl10036,CONFIG_DVB_ZL10036)
endef

define KernelPackage/dvb-zl10036/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-zl10036))

define KernelPackage/dvb-zl10039
  TITLE:=Zarlink ZL10039 silicon tuner
  $(call SetFrontend,zl10039,CONFIG_DVB_ZL10039)
endef

define KernelPackage/dvb-zl10039/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-zl10039))

define KernelPackage/dvb-s5h1420
  TITLE:=Samsung S5H1420 based
  $(call SetFrontend,s5h1420,CONFIG_DVB_S5H1420)
endef

define KernelPackage/dvb-s5h1420/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-s5h1420))

define KernelPackage/dvb-stv0288
  TITLE:=ST STV0288 based
  $(call SetFrontend,stv0288,CONFIG_DVB_STV0288)
endef

define KernelPackage/dvb-stv0288/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-stv0288))

define KernelPackage/dvb-stb6000
  TITLE:=ST STB6000 silicon tuner
  $(call SetFrontend,stb6000,CONFIG_DVB_STB6000)
endef

define KernelPackage/dvb-stb6000/description
 A DVB-S silicon tuner module. Say Y when you want to support this tuner.
endef

$(eval $(call KernelPackage,dvb-stb6000))

define KernelPackage/dvb-stv0299
  TITLE:=ST STV0299 based
  $(call SetFrontend,stv0299,CONFIG_DVB_STV0299)
endef

define KernelPackage/dvb-stv0299/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-stv0299))

define KernelPackage/dvb-stv6110
  TITLE:=ST STV6110 silicon tuner
  $(call SetFrontend,stv6110,CONFIG_DVB_STV6110)
endef

define KernelPackage/dvb-stv6110/description
 A DVB-S silicon tuner module. Say Y when you want to support this tuner.
endef

$(eval $(call KernelPackage,dvb-stv6110))

define KernelPackage/dvb-stv0900
  TITLE:=ST STV0900 based
  $(call SetFrontend,stv0900,CONFIG_DVB_STV0900)
endef

define KernelPackage/dvb-stv0900/description
 A DVB-S/S2 demodulator. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-stv0900))

define KernelPackage/dvb-tda8083
  TITLE:=Philips TDA8083 based
  $(call SetFrontend,tda8083,CONFIG_DVB_TDA8083)
endef

define KernelPackage/dvb-tda8083/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tda8083))

define KernelPackage/dvb-tda10086
  TITLE:=Philips TDA10086 based
  $(call SetFrontend,tda10086,CONFIG_DVB_TDA10086)
endef

define KernelPackage/dvb-tda10086/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tda10086))

define KernelPackage/dvb-tda8261
  TITLE:=Philips TDA8261 based
  $(call SetFrontend,tda8261,CONFIG_DVB_TDA8261)
endef

define KernelPackage/dvb-tda8261/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tda8261))

define KernelPackage/dvb-ves1x93
  TITLE:=VLSI VES1893 or VES1993 based
  $(call SetFrontend,ves1x93,CONFIG_DVB_VES1X93)
endef

define KernelPackage/dvb-ves1x93/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-ves1x93))

define KernelPackage/dvb-tuner-itd1000
  TITLE:=Integrant ITD1000 Zero IF tuner for DVB-S/DSS
  $(call SetFrontend,tuner-itd1000,CONFIG_DVB_TUNER_ITD1000)
endef

define KernelPackage/dvb-tuner-itd1000/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tuner-itd1000))

define KernelPackage/dvb-tuner-cx24113
  TITLE:=Conexant CX24113/CX24128 tuner for DVB-S/DSS
  $(call SetFrontend,tuner-cx24113,CONFIG_DVB_TUNER_CX24113)
endef

define KernelPackage/dvb-tuner-cx24113/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tuner-cx24113))

define KernelPackage/dvb-tda826x
  TITLE:=Philips TDA826X silicon tuner
  $(call SetFrontend,tda826x,CONFIG_DVB_TDA826X)
endef

define KernelPackage/dvb-tda826x/description
 A DVB-S silicon tuner module. Say Y when you want to support this tuner.
endef

$(eval $(call KernelPackage,dvb-tda826x))

define KernelPackage/dvb-tua6100
  TITLE:=Infineon TUA6100 PLL
  $(call SetFrontend,tua6100,CONFIG_DVB_TUA6100)
endef

define KernelPackage/dvb-tua6100/description
 A DVB-S PLL chip.
endef

$(eval $(call KernelPackage,dvb-tua6100))

define KernelPackage/dvb-cx24116
  TITLE:=Conexant CX24116 based
  $(call SetFrontend,cx24116,CONFIG_DVB_CX24116)
endef

define KernelPackage/dvb-cx24116/description
 A DVB-S/S2 tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-cx24116))

define KernelPackage/dvb-cx24117
  TITLE:=Conexant CX24117 based
  $(call SetFrontend,cx24117,CONFIG_DVB_CX24117)
endef

define KernelPackage/dvb-cx24117/description
 A Dual DVB-S/S2 tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-cx24117))

define KernelPackage/dvb-cx24120
  TITLE:=Conexant CX24120 based
  $(call SetFrontend,cx24120,CONFIG_DVB_CX24120)
endef

define KernelPackage/dvb-cx24120/description
 A DVB-S/S2 tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-cx24120))

define KernelPackage/dvb-si21xx
  TITLE:=Silicon Labs SI21XX based
  $(call SetFrontend,si21xx,CONFIG_DVB_SI21XX)
endef

define KernelPackage/dvb-si21xx/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-si21xx))

define KernelPackage/dvb-ts2020
  TITLE:=Montage Tehnology TS2020 based tuners
  $(call SetFrontend,ts2020,CONFIG_DVB_TS2020)
endef

define KernelPackage/dvb-ts2020/description
 A DVB-S/S2 silicon tuner. Say Y when you want to support this tuner.
endef

$(eval $(call KernelPackage,dvb-ts2020))

define KernelPackage/dvb-ds3000
  TITLE:=Montage Tehnology DS3000 based
  $(call SetFrontend,ds3000,CONFIG_DVB_DS3000)
endef

define KernelPackage/dvb-ds3000/description
 A DVB-S/S2 tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-ds3000))

define KernelPackage/dvb-mb86a16
  TITLE:=Fujitsu MB86A16 based
  $(call SetFrontend,mb86a16,CONFIG_DVB_MB86A16)
endef

define KernelPackage/dvb-mb86a16/description
 A DVB-S/DSS Direct Conversion reveiver.
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-mb86a16))

define KernelPackage/dvb-tda10071
  TITLE:=NXP TDA10071
  $(call SetFrontend,tda10071,CONFIG_DVB_TDA10071)
endef

define KernelPackage/dvb-tda10071/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tda10071))

define KernelPackage/dvb-sp8870
  TITLE:=Spase sp8870 based
  $(call SetFrontend,sp8870,CONFIG_DVB_SP8870)
endef

define KernelPackage/dvb-sp8870/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-sp8870))

define KernelPackage/dvb-sp887x
  TITLE:=Spase sp887x based
  $(call SetFrontend,sp887x,CONFIG_DVB_SP887X)
endef

define KernelPackage/dvb-sp887x/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-sp887x))

define KernelPackage/dvb-cx22700
  TITLE:=Conexant CX22700 based
  $(call SetFrontend,cx22700,CONFIG_DVB_CX22700)
endef

define KernelPackage/dvb-cx22700/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-cx22700))

define KernelPackage/dvb-cx22702
  TITLE:=Conexant cx22702 demodulator (OFDM)
  $(call SetFrontend,cx22702,CONFIG_DVB_CX22702)
endef

define KernelPackage/dvb-cx22702/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-cx22702))

define KernelPackage/dvb-s5h1432
  TITLE:=Samsung s5h1432 demodulator (OFDM)
  $(call SetFrontend,s5h1432,CONFIG_DVB_S5H1432)
endef

define KernelPackage/dvb-s5h1432/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-s5h1432))

define KernelPackage/dvb-drxd
  TITLE:=Micronas DRXD driver
  $(call SetFrontend,drxd,CONFIG_DVB_DRXD)
endef

define KernelPackage/dvb-drxd/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-drxd))

define KernelPackage/dvb-l64781
  TITLE:=LSI L64781
  $(call SetFrontend,l64781,CONFIG_DVB_L64781)
endef

define KernelPackage/dvb-l64781/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-l64781))

define KernelPackage/dvb-tda1004x
  TITLE:=Philips TDA10045H/TDA10046H based
  $(call SetFrontend,tda1004x,CONFIG_DVB_TDA1004X)
endef

define KernelPackage/dvb-tda1004x/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tda1004x))

define KernelPackage/dvb-nxt6000
  TITLE:=NxtWave Communications NXT6000 based
  $(call SetFrontend,nxt6000,CONFIG_DVB_NXT6000)
endef

define KernelPackage/dvb-nxt6000/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-nxt6000))

define KernelPackage/dvb-mt352
  TITLE:=Zarlink MT352 based
  $(call SetFrontend,mt352,CONFIG_DVB_MT352)
endef

define KernelPackage/dvb-mt352/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-mt352))

define KernelPackage/dvb-zl10353
  TITLE:=Zarlink ZL10353 based
  $(call SetFrontend,zl10353,CONFIG_DVB_ZL10353)
endef

define KernelPackage/dvb-zl10353/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-zl10353))

define KernelPackage/dvb-dib3000mb
  TITLE:=DiBcom 3000M-B
  $(call SetFrontend,dib3000mb,CONFIG_DVB_DIB3000MB)
endef

define KernelPackage/dvb-dib3000mb/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib3000mb))

define KernelPackage/dvb-dib3000mc
  TITLE:=DiBcom 3000P/M-C
  $(call SetFrontend,dib3000mc,CONFIG_DVB_DIB3000MC,+kmod-dvb-dibx000-common)
endef

define KernelPackage/dvb-dib3000mc/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib3000mc))

define KernelPackage/dvb-dib7000m
  TITLE:=DiBcom 7000MA/MB/PA/PB/MC
  $(call SetFrontend,dib7000m,CONFIG_DVB_DIB7000M,+kmod-dvb-dibx000-common)
endef

define KernelPackage/dvb-dib7000m/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib7000m))

define KernelPackage/dvb-dib7000p
  TITLE:=DiBcom 7000PC
  $(call SetFrontend,dib7000p,CONFIG_DVB_DIB7000P,+kmod-dvb-dibx000-common)
endef

define KernelPackage/dvb-dib7000p/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib7000p))

define KernelPackage/dvb-dib9000
  TITLE:=DiBcom 9000
  $(call SetFrontend,dib9000,CONFIG_DVB_DIB9000,+kmod-dvb-dibx000-common)
endef

define KernelPackage/dvb-dib9000/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib9000))

define KernelPackage/dvb-tda10048
  TITLE:=Philips TDA10048HN based
  $(call SetFrontend,tda10048,CONFIG_DVB_TDA10048)
endef

define KernelPackage/dvb-tda10048/description
 A DVB-T tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tda10048))

define KernelPackage/dvb-af9013
  TITLE:=Afatech AF9013 demodulator
  $(call SetFrontend,af9013,CONFIG_DVB_AF9013)
endef

define KernelPackage/dvb-af9013/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-af9013))

define KernelPackage/dvb-ec100
  TITLE:=E3C EC100
  $(call SetFrontend,ec100,CONFIG_DVB_EC100)
endef

define KernelPackage/dvb-ec100/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-ec100))

define KernelPackage/dvb-stv0367
  TITLE:=ST STV0367 based
  $(call SetFrontend,stv0367,CONFIG_DVB_STV0367)
endef

define KernelPackage/dvb-stv0367/description
 A DVB-T/C tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-stv0367))

define KernelPackage/dvb-cxd2820r
  TITLE:=Sony CXD2820R
  $(call SetFrontend,cxd2820r,CONFIG_DVB_CXD2820R)
endef

define KernelPackage/dvb-cxd2820r/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-cxd2820r))

define KernelPackage/dvb-cxd2841er
  TITLE:=Sony CXD2841ER
  $(call SetFrontend,cxd2841er,CONFIG_DVB_CXD2841ER)
endef

define KernelPackage/dvb-cxd2841er/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-cxd2841er))

define KernelPackage/dvb-rtl2830
  TITLE:=Realtek RTL2830 DVB-T
  $(call SetFrontend,rtl2830,CONFIG_DVB_RTL2830)
endef

define KernelPackage/dvb-rtl2830/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-rtl2830))

define KernelPackage/dvb-rtl2832
  TITLE:=Realtek RTL2832 DVB-T
  $(call SetFrontend,rtl2832,CONFIG_DVB_RTL2832)
endef

define KernelPackage/dvb-rtl2832/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-rtl2832))

define KernelPackage/dvb-rtl2832-sdr
  TITLE:=Realtek RTL2832 SDR
  $(call SetFrontend,rtl2832-sdr,CONFIG_DVB_RTL2832_SDR)
endef

define KernelPackage/dvb-rtl2832-sdr/description
 Say Y when you want to support this SDR module.
endef

$(eval $(call KernelPackage,dvb-rtl2832-sdr))

define KernelPackage/dvb-si2168
  TITLE:=Silicon Labs Si2168
  $(call SetFrontend,si2168,CONFIG_DVB_SI2168)
endef

define KernelPackage/dvb-si2168/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-si2168))

define KernelPackage/dvb-zd1301-demod
  TITLE:=ZyDAS ZD1301
  $(call SetFrontend,zd1301-demod,CONFIG_DVB_ZD1301_DEMOD)
endef

define KernelPackage/dvb-zd1301-demod/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-zd1301-demod))

define KernelPackage/dvb-ves1820
  TITLE:=VLSI VES1820 based
  $(call SetFrontend,ves1820,CONFIG_DVB_VES1820)
endef

define KernelPackage/dvb-ves1820/description
 A DVB-C tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-ves1820))

define KernelPackage/dvb-tda10021
  TITLE:=Philips TDA10021 based
  $(call SetFrontend,tda10021,CONFIG_DVB_TDA10021)
endef

define KernelPackage/dvb-tda10021/description
 A DVB-C tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tda10021))

define KernelPackage/dvb-tda10023
  TITLE:=Philips TDA10023 based
  $(call SetFrontend,tda10023,CONFIG_DVB_TDA10023)
endef

define KernelPackage/dvb-tda10023/description
 A DVB-C tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tda10023))

define KernelPackage/dvb-stv0297
  TITLE:=ST STV0297 based
  $(call SetFrontend,stv0297,CONFIG_DVB_STV0297)
endef

define KernelPackage/dvb-stv0297/description
 A DVB-C tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-stv0297))

define KernelPackage/dvb-nxt200x
  TITLE:=NxtWave Communications NXT2002/NXT2004 based
  $(call SetFrontend,nxt200x,CONFIG_DVB_NXT200X)
endef

define KernelPackage/dvb-nxt200x/description
 An ATSC 8VSB and QAM64/256 tuner module. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-nxt200x))

define KernelPackage/dvb-or51211
  TITLE:=Oren OR51211 based
  $(call SetFrontend,or51211,CONFIG_DVB_OR51211)
endef

define KernelPackage/dvb-or51211/description
 An ATSC 8VSB tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-or51211))

define KernelPackage/dvb-or51132
  TITLE:=Oren OR51132 based
  $(call SetFrontend,or51132,CONFIG_DVB_OR51132)
endef

define KernelPackage/dvb-or51132/description
 An ATSC 8VSB and QAM64/256 tuner module. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-or51132))

define KernelPackage/dvb-bcm3510
  TITLE:=Broadcom BCM3510
  $(call SetFrontend,bcm3510,CONFIG_DVB_BCM3510)
endef

define KernelPackage/dvb-bcm3510/description
 An ATSC 8VSB/16VSB and QAM64/256 tuner module. Say Y when you want to
 support this frontend.
endef

$(eval $(call KernelPackage,dvb-bcm3510))

define KernelPackage/dvb-lgdt330x
  TITLE:=LG Electronics LGDT3302/LGDT3303 based
  $(call SetFrontend,lgdt330x,CONFIG_DVB_LGDT330X)
endef

define KernelPackage/dvb-lgdt330x/description
 An ATSC 8VSB and QAM64/256 tuner module. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-lgdt330x))

define KernelPackage/dvb-lgdt3305
  TITLE:=LG Electronics LGDT3304 and LGDT3305 based
  $(call SetFrontend,lgdt3305,CONFIG_DVB_LGDT3305)
endef

define KernelPackage/dvb-lgdt3305/description
 An ATSC 8VSB and QAM64/256 tuner module. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-lgdt3305))

define KernelPackage/dvb-lgdt3306a
  TITLE:=LG Electronics LGDT3306A based
  $(call SetFrontend,lgdt3306a,CONFIG_DVB_LGDT3306A)
endef

define KernelPackage/dvb-lgdt3306a/description
 An ATSC 8VSB and QAM-B 64/256 demodulator module. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-lgdt3306a))

define KernelPackage/dvb-lg2160
  TITLE:=LG Electronics LG216x based
  $(call SetFrontend,lg2160,CONFIG_DVB_LG2160)
endef

define KernelPackage/dvb-lg2160/description
 An ATSC/MH demodulator module. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-lg2160))

define KernelPackage/dvb-s5h1409
  TITLE:=Samsung S5H1409 based
  $(call SetFrontend,s5h1409,CONFIG_DVB_S5H1409)
endef

define KernelPackage/dvb-s5h1409/description
 An ATSC 8VSB and QAM64/256 tuner module. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-s5h1409))

define KernelPackage/dvb-au8522-dtv
  TITLE:=Auvitek AU8522 based DTV demod
  $(call SetFrontend,au8522-dtv,CONFIG_DVB_AU8522_DTV)
endef

define KernelPackage/dvb-au8522-dtv/description
 An ATSC 8VSB, QAM64/256 & NTSC demodulator module. Say Y when
 you want to enable DTV demodulation support for this frontend.
endef

$(eval $(call KernelPackage,dvb-au8522-dtv))

define KernelPackage/dvb-au8522-v4l
  TITLE:=Auvitek AU8522 based ATV demod
  $(call SetFrontend,au8522-v4l,CONFIG_DVB_AU8522_V4L)
endef

define KernelPackage/dvb-au8522-v4l/description
 An ATSC 8VSB, QAM64/256 & NTSC demodulator module. Say Y when
 you want to enable ATV demodulation support for this frontend.
endef

$(eval $(call KernelPackage,dvb-au8522-v4l))

define KernelPackage/dvb-s5h1411
  TITLE:=Samsung S5H1411 based
  $(call SetFrontend,s5h1411,CONFIG_DVB_S5H1411)
endef

define KernelPackage/dvb-s5h1411/description
 An ATSC 8VSB and QAM64/256 tuner module. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-s5h1411))

define KernelPackage/dvb-s921
  TITLE:=Sharp S921 frontend
  $(call SetFrontend,s921,CONFIG_DVB_S921)
endef

define KernelPackage/dvb-s921/description
 AN ISDB-T DQPSK, QPSK, 16QAM and 64QAM 1seg tuner module.
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-s921))

define KernelPackage/dvb-dib8000
  TITLE:=DiBcom 8000MB/MC
  $(call SetFrontend,dib8000,CONFIG_DVB_DIB8000,+kmod-dvb-dibx000-common)
endef

define KernelPackage/dvb-dib8000/description
 A driver for DiBcom's DiB8000 ISDB-T/ISDB-Tsb demodulator.
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib8000))

define KernelPackage/dvb-mb86a20s
  TITLE:=Fujitsu mb86a20s
  $(call SetFrontend,mb86a20s,CONFIG_DVB_MB86A20S)
endef

define KernelPackage/dvb-mb86a20s/description
 A driver for Fujitsu mb86a20s ISDB-T/ISDB-Tsb demodulator.
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-mb86a20s))

define KernelPackage/dvb-tc90522
  TITLE:=Toshiba TC90522
  $(call SetFrontend,tc90522,CONFIG_DVB_TC90522)
endef

define KernelPackage/dvb-tc90522/description
 Toshiba TC90522 2xISDB-S 8PSK + 2xISDB-T OFDM demodulator.
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-tc90522))

define KernelPackage/dvb-mn88443x
  TITLE:=Socionext MN88443x
  $(call SetFrontend,mn88443x,CONFIG_DVB_MN88443X)
endef

define KernelPackage/dvb-mn88443x/description
 A driver for Socionext/Panasonic MN884433 and MN884434
 ISDB-S + ISDB-T demodulator.
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-mn88443x))

define KernelPackage/dvb-pll
  TITLE:=Generic I2C PLL based tuners
  $(call SetFrontend,pll,CONFIG_DVB_PLL)
endef

define KernelPackage/dvb-pll/description
 This module drives a number of tuners based on PLL chips with a
 common I2C interface. Say Y when you want to support these tuners.
endef

$(eval $(call KernelPackage,dvb-pll))

define KernelPackage/dvb-tuner-dib0070
  TITLE:=DiBcom DiB0070 silicon base-band tuner
  $(call SetFrontend,tuner-dib0070,CONFIG_DVB_TUNER_DIB0070)
endef

define KernelPackage/dvb-tuner-dib0070/description
 A driver for the silicon baseband tuner DiB0070 from DiBcom.
 This device is only used inside a SiP called together with a
 demodulator for now.
endef

$(eval $(call KernelPackage,dvb-tuner-dib0070))

define KernelPackage/dvb-tuner-dib0090
  TITLE:=DiBcom DiB0090 silicon base-band tuner
  $(call SetFrontend,tuner-dib0090,CONFIG_DVB_TUNER_DIB0090)
endef

define KernelPackage/dvb-tuner-dib0090/description
 A driver for the silicon baseband tuner DiB0090 from DiBcom.
 This device is only used inside a SiP called together with a
 demodulator for now.
endef

$(eval $(call KernelPackage,dvb-tuner-dib0090))

define KernelPackage/dvb-lnbh25
  TITLE:=LNBH25 SEC controller
  $(call SetFrontend,lnbh25,CONFIG_DVB_LNBH25)
endef

define KernelPackage/dvb-lnbh25/description
 An SEC control chip.
 Say Y when you want to support this chip.
endef

$(eval $(call KernelPackage,dvb-lnbh25))

define KernelPackage/dvb-lnbh29
  TITLE:=LNBH29 SEC controller
  $(call SetFrontend,lnbh29,CONFIG_DVB_LNBH29)
endef

define KernelPackage/dvb-lnbh29/description
 LNB power supply and control voltage
 regulator chip with step-up converter
 and I2C interface for STMicroelectronics LNBH29.
 Say Y when you want to support this chip.
endef

$(eval $(call KernelPackage,dvb-lnbh29))

define KernelPackage/dvb-lnbp21
  TITLE:=LNBP21/LNBH24 SEC controllers
  $(call SetFrontend,lnbp21,CONFIG_DVB_LNBP21)
endef

define KernelPackage/dvb-lnbp21/description
 An SEC control chips.
endef

$(eval $(call KernelPackage,dvb-lnbp21))

define KernelPackage/dvb-lnbp22
  TITLE:=LNBP22 SEC controllers
  $(call SetFrontend,lnbp22,CONFIG_DVB_LNBP22)
endef

define KernelPackage/dvb-lnbp22/description
 LNB power supply and control voltage
 regulator chip with step-up converter
 and I2C interface.
 Say Y when you want to support this chip.
endef

$(eval $(call KernelPackage,dvb-lnbp22))

define KernelPackage/dvb-isl6405
  TITLE:=ISL6405 SEC controller
  $(call SetFrontend,isl6405,CONFIG_DVB_ISL6405)
endef

define KernelPackage/dvb-isl6405/description
 An SEC control chip.
endef

$(eval $(call KernelPackage,dvb-isl6405))

define KernelPackage/dvb-isl6421
  TITLE:=ISL6421 SEC controller
  $(call SetFrontend,isl6421,CONFIG_DVB_ISL6421)
endef

define KernelPackage/dvb-isl6421/description
 An SEC control chip.
endef

$(eval $(call KernelPackage,dvb-isl6421))

define KernelPackage/dvb-isl6423
  TITLE:=ISL6423 SEC controller
  $(call SetFrontend,isl6423,CONFIG_DVB_ISL6423)
endef

define KernelPackage/dvb-isl6423/description
 A SEC controller chip from Intersil
endef

$(eval $(call KernelPackage,dvb-isl6423))

define KernelPackage/dvb-lgs8gl5
  TITLE:=Legend Silicon LGS-8GL5 demodulator (OFDM)
  $(call SetFrontend,lgs8gl5,CONFIG_DVB_LGS8GL5)
endef

define KernelPackage/dvb-lgs8gl5/description
 A DMB-TH tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-lgs8gl5))

define KernelPackage/dvb-lgs8gxx
  TITLE:=Legend Silicon LGS8913/LGS8GL5/LGS8GXX demodulator
  $(call SetFrontend,lgs8gxx,CONFIG_DVB_LGS8GXX)
endef

define KernelPackage/dvb-lgs8gxx/description
 A DMB-TH tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-lgs8gxx))

define KernelPackage/dvb-atbm8830
  TITLE:=AltoBeam ATBM8830/8831 DMB-TH demodulator
  $(call SetFrontend,atbm8830,CONFIG_DVB_ATBM8830)
endef

define KernelPackage/dvb-atbm8830/description
 A DMB-TH tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-atbm8830))

define KernelPackage/dvb-tda665x
  TITLE:=TDA665x tuner
  $(call SetFrontend,tda665x,CONFIG_DVB_TDA665x)
endef

define KernelPackage/dvb-tda665x/description
 Support for tuner modules based on Philips TDA6650/TDA6651 chips.
 Say Y when you want to support this chip.
endef

$(eval $(call KernelPackage,dvb-tda665x))

define KernelPackage/dvb-ix2505v
  TITLE:=Sharp IX2505V silicon tuner
  $(call SetFrontend,ix2505v,CONFIG_DVB_IX2505V)
endef

define KernelPackage/dvb-ix2505v/description
 A DVB-S tuner module. Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-ix2505v))

define KernelPackage/dvb-m88rs2000
  TITLE:=M88RS2000 DVB-S demodulator and tuner
  $(call SetFrontend,m88rs2000,CONFIG_DVB_M88RS2000)
endef

define KernelPackage/dvb-m88rs2000/description
 A DVB-S tuner module.
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-m88rs2000))

define KernelPackage/dvb-horus3a
  TITLE:=Sony Horus3A tuner
  $(call SetFrontend,horus3a,CONFIG_DVB_HORUS3A)
endef

define KernelPackage/dvb-horus3a/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-horus3a))

define KernelPackage/dvb-ascot2e
  TITLE:=Sony Ascot2E tuner
  $(call SetFrontend,ascot2e,CONFIG_DVB_ASCOT2E)
endef

define KernelPackage/dvb-ascot2e/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-ascot2e))

define KernelPackage/dvb-helene
  TITLE:=Sony HELENE Sat/Ter tuner (CXD2858ER)
  $(call SetFrontend,helene,CONFIG_DVB_HELENE)
endef

define KernelPackage/dvb-helene/description
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-helene))

define KernelPackage/dvb-cxd2099
  TITLE:=Sony CXD2099AR Common Interface driver
  $(call SetFrontend,cxd2099,CONFIG_DVB_CXD2099)
endef

define KernelPackage/dvb-cxd2099/description
 A driver for the CI controller currently found mostly on
 Digital Devices DuoFlex CI (single) addon modules.
endef

$(eval $(call KernelPackage,dvb-cxd2099))

define KernelPackage/dvb-sp2
  TITLE:=CIMaX SP2
  $(call SetFrontend,sp2,CONFIG_DVB_SP2)
endef

define KernelPackage/dvb-sp2/description
 CIMaX SP2/SP2HF Common Interface module.
endef

$(eval $(call KernelPackage,dvb-sp2))
