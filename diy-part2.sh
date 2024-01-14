#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP Gate #
sed -i 's/192.168.1.1/172.16.253.254/g' package/base-files/files/bin/config_generate
echo '### Updates default IP gate ###'

# argon theme plug-in components #
rm -rf package/feeds/luci/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
echo '### luci-theme-argon ###'

# argon config plug-in components #
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/feeds/luci/luci-app-argon-config
echo '### luci-app-argon-config ###'

# shutdown plug-in components #
git clone https://github.com/ZHOUJUNX/luci-app-poweroff.git package/feeds/luci/luci-app-poweroff
echo '### Shutdown Router ###'

# turboacc plug-in components #
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh
echo '### turboacc plug-in components ###'
