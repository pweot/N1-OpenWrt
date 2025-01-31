#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate
echo 'src-git small https://github.com/kenzok8/small-package' >>feeds.conf.default
# Firewall
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

# Remove packages
#rm -rf feeds/luci/applications/luci-app-passwall
#rm -rf feeds/packages/net/haproxy
#rm -rf feeds/packages/net/v2ray-geodata
sed -i 's/$(TARGET_DIR)) install/$(TARGET_DIR)) install --force-overwrite --force-depends/' package/Makefile

# Add packages
#svn co https://github.com/nantayo/my-pkg/trunk package/my-pkg
#svn co https://github.com/ophub/luci-app-amlogic/trunk package/amlogic
#svn co https://github.com/sbwml/luci-app-mosdns/trunk package/mosdns
