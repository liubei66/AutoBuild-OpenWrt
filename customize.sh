#1.Modify default IP
if [ -e package/base-files/files/bin/config_generate ] ; then
        sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
fi
cp -f zzz-default-settings package/lean/default-settings/files/zzz-default-settings
#2.Modify the version number
if [ -e package/lean/default-settings/files/zzz-default-settings ] ; then
        sed -i 's/OpenWrt/J.K.Peng build on $(date "+%Y.%m.%d") @OpenWrt/g' package/lean/default-settings/files/zzz-default-settings
fi
#3.Modify default theme
if [ -e feeds/luci/collections/luci/Makefile ] ; then
        sed -i 's/luci-theme-bootstrap/luci-theme-netgear/g' feeds/luci/collections/luci/Makefile
fi
#4.Modify the shell banner
if [ -e package/base-files/files/etc/banner ] ; then
        sed -i '7d' package/base-files/files/etc/banner
        sed -i "7i \ \ \ \ \ \ \ \ \ J.K.Peng build on $(date "+%Y.%m.%d") @OpenWrt" package/base-files/files/etc/banner
fi

find package/lean/luci-app-softethervpn/ -name "*.lua"|xargs sed -i 's/\"vpn\"/\"services\"/g' 
find package/lean/luci-app-softethervpn/ -name "*.htm"|xargs sed -i 's/\"vpn\"/\"services\"/g' 
find package/lean/luci-app-softethervpn/ -name "*.htm"|xargs sed -i 's/admin\/vpn/admin\/services/g'
find package/lean/luci-app-softethervpn/ -name "*.lua"|xargs sed -i 's/admin\/vpn/admin\/services/g'
find package/openwrt-packages/luci-app-passwall/ -name "*.lua"|xargs sed -i 's/\"vpn\"/\"services\"/g' 
find package/openwrt-packages/luci-app-passwall/ -name "*.htm"|xargs sed -i 's/\"vpn\"/\"services\"/g' 
find package/openwrt-packages/luci-app-passwall/ -name "*.htm"|xargs sed -i 's/admin\/vpn/admin\/services/g'
find package/openwrt-packages/luci-app-passwall/ -name "*.lua"|xargs sed -i 's/admin\/vpn/admin\/services/g'
find package/lean/luci-app-cifs-mount -name "*.lua"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find package/lean/luci-app-cifs-mount -name "*.htm"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find package/lean/luci-app-cifs-mount -name "*.htm"|xargs sed -i 's/admin\/nas/admin\/services/g'
find package/lean/luci-app-cifs-mount -name "*.lua"|xargs sed -i 's/admin\/nas/admin\/services/g'

make defconfig
