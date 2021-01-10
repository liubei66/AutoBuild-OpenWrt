#1.Modify default IP

if [ -e package/base-files/files/bin/config_generate ] ; then
        sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
fi
cp -f zzz-default-settings package/lean/default-settings/files/zzz-default-settings
#2.Modify the version number
Build_time=`date "+%Y.%m.%d"`
if [ -e package/lean/default-settings/files/zzz-default-settings ] ; then
        sed -i "s/OpenWrt/J.K.Peng build on ${Build_time} OpenWrt/g" package/lean/default-settings/files/zzz-default-settings
fi
#3.Modify default theme
if [ -e feeds/luci/collections/luci/Makefile ] ; then
        sed -i 's/luci-theme-bootstrap/luci-theme-netgear/g' feeds/luci/collections/luci/Makefile
fi
#4.Modify the shell banner
if [ -e package/base-files/files/etc/banner ] ; then

echo '      ##     ##    ##     ########  ######## ##    ##  ######   
      ##     ##   ##      ##     ## ##       ###   ## ##    ##  
      ##     ##  ##       ##     ## ##       ####  ## ##        
      ##     #####        ########  ######   ## ## ## ##   #### 
##    ##     ##  ##       ##        ##       ##  #### ##    ##  
##    ## ### ##   ##  ### ##        ##       ##   ### ##    ##  
 ######  ### ##    ## ### ##        ######## ##    ##  ######   
    -----------------------------------------------------' > package/base-files/files/etc/banner
echo "           J.K.Peng build on $(date "+%Y.%m.%d") OpenWrt" >> package/base-files/files/etc/banner
echo '    -----------------------------------------------------' >> package/base-files/files/etc/banner

fi
#5.Modify the host name
sed -i 's/OpenWrt/J.K.Peng/g' package/base-files/files/bin/config_generate

find package/lean/luci-app-softethervpn/ -name "*.lua"|xargs sed -i 's/\"vpn\"/\"services\"/g'
find package/lean/luci-app-softethervpn/ -name "*.lua"|xargs sed -i 's/admin\/vpn/admin\/services/g'
find package/lean/luci-app-softethervpn/ -name "*.htm"|xargs sed -i 's/\"vpn\"/\"services\"/g' 
find package/lean/luci-app-softethervpn/ -name "*.htm"|xargs sed -i 's/admin\/vpn/admin\/services/g'
find package/lean/luci-app-softethervpn/ -name "*.lua"|xargs sed -i 's/\"VPN\"\,\ 45/\"Services\"\,\ 45/g'
find package/lean/luci-app-softethervpn/ -name "*.lua"|xargs sed -i 's/\"services\"\,\ 45/\"Services\"\,\ 45/g'
find package/openwrt-packages/luci-app-passwall/ -name "*.lua"|xargs sed -i 's/\"vpn\"/\"services\"/g'
find package/openwrt-packages/luci-app-passwall/ -name "*.lua"|xargs sed -i 's/admin\/vpn/admin\/services/g'
find package/openwrt-packages/luci-app-passwall/ -name "*.htm"|xargs sed -i 's/\"vpn\"/\"services\"/g' 
find package/openwrt-packages/luci-app-passwall/ -name "*.htm"|xargs sed -i 's/admin\/vpn/admin\/services/g'
find package/openwrt-packages/luci-app-passwall/ -name "*.lua"|xargs sed -i 's/\"VPN\"\,\ 45/\"Services\"\,\ 45/g'
find package/openwrt-packages/luci-app-passwall/ -name "*.lua"|xargs sed -i 's/\"services\"\,\ 45/\"Services\"\,\ 45/g'
find package/lean/luci-app-cifs-mount -name "*.lua"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find package/lean/luci-app-cifs-mount -name "*.htm"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find package/lean/luci-app-cifs-mount -name "*.htm"|xargs sed -i 's/admin\/nas/admin\/services/g'
find package/lean/luci-app-cifs-mount -name "*.lua"|xargs sed -i 's/admin\/nas/admin\/services/g'

find package/lean/luci-app-nft-qos/ -name "*.lua"|xargs sed -i 's/\"services\"/\"network\"/g' 
find package/lean/luci-app-nft-qos/ -name "*.htm"|xargs sed -i 's/\"services\"/\"network\"/g' 
find package/lean/luci-app-nft-qos/ -name "*.htm"|xargs sed -i 's/admin\/services/admin\/network/g'
find package/lean/luci-app-nft-qos/ -name "*.lua"|xargs sed -i 's/admin\/services/admin\/network/g'

rm -rf package/feeds-xiaoqingfeng/luci-app-sqm/
find feeds/luci/applications/luci-app-sqm/ -name "*.lua"|xargs sed -i 's/\"services\"/\"network\"/g' 
find feeds/luci/applications/luci-app-sqm/ -name "*.htm"|xargs sed -i 's/\"services\"/\"network\"/g' 
find feeds/luci/applications/luci-app-sqm/ -name "*.htm"|xargs sed -i 's/admin\/services/admin\/network/g'
find feeds/luci/applications/luci-app-sqm/ -name "*.lua"|xargs sed -i 's/admin\/services/admin\/network/g'

rm -rf package/feeds-xiaoqingfeng/luci-app-upnp/
find package/feeds/luci/luci-app-upnp/ -name "*.lua"|xargs sed -i 's/\"services\"/\"network\"/g' 
find package/feeds/luci/luci-app-upnp/ -name "*.htm"|xargs sed -i 's/\"services\"/\"network\"/g' 
find package/feeds/luci/luci-app-upnp/ -name "*.htm"|xargs sed -i 's/admin\/services/admin\/network/g'
find package/feeds/luci/luci-app-upnp/ -name "*.lua"|xargs sed -i 's/admin\/services/admin\/network/g'

find package/feeds/luci/luci-app-wol/ -name "*.lua"|xargs sed -i 's/\"services\"/\"network\"/g' 
find package/feeds/luci/luci-app-wol/ -name "*.htm"|xargs sed -i 's/\"services\"/\"network\"/g' 
find package/feeds/luci/luci-app-wol/ -name "*.htm"|xargs sed -i 's/admin\/services/admin\/network/g'
find package/feeds/luci/luci-app-wol/ -name "*.lua"|xargs sed -i 's/admin\/services/admin\/network/g'

find feeds/luci/applications/luci-app-vsftpd/ -name "*.lua"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find feeds/luci/applications/luci-app-vsftpd/ -name "*.htm"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find feeds/luci/applications/luci-app-vsftpd/ -name "*.htm"|xargs sed -i 's/admin\/nas/admin\/services/g'
find feeds/luci/applications/luci-app-vsftpd/ -name "*.lua"|xargs sed -i 's/admin\/nas/admin\/services/g'
find package/lean/luci-app-vsftpd/ -name "*.lua"|xargs sed -i 's/\"nas\"/\"services\"/g'
find package/lean/luci-app-vsftpd/ -name "*.htm"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find package/lean/luci-app-vsftpd/ -name "*.htm"|xargs sed -i 's/admin\/nas/admin\/services/g'
find package/lean/luci-app-vsftpd/ -name "*.lua"|xargs sed -i 's/admin\/nas/admin\/services/g'

find feeds/luci/applications/luci-app-samba/ -name "*.lua"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find feeds/luci/applications/luci-app-samba/ -name "*.htm"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find feeds/luci/applications/luci-app-samba/ -name "*.htm"|xargs sed -i 's/admin\/nas/admin\/services/g'
find feeds/luci/applications/luci-app-samba/ -name "*.lua"|xargs sed -i 's/admin\/nas/admin\/services/g'
find package/lean/luci-app-samba/ -name "*.lua"|xargs sed -i 's/\"nas\"/\"services\"/g'
find package/lean/luci-app-samba/ -name "*.htm"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find package/lean/luci-app-samba -name "*.htm"|xargs sed -i 's/admin\/nas/admin\/services/g'
find package/lean/luci-app-samba/ -name "*.lua"|xargs sed -i 's/admin\/nas/admin\/services/g'

find feeds/luci/applications/luci-app-hd-idle/ -name "*.lua"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find feeds/luci/applications/luci-app-hd-idle -name "*.htm"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find feeds/luci/applications/luci-app-hd-idle/ -name "*.htm"|xargs sed -i 's/admin\/nas/admin\/services/g'
find feeds/luci/applications/luci-app-hd-idle/ -name "*.lua"|xargs sed -i 's/admin\/nas/admin\/services/g'
find package/lean/luci-app-hd-idle/ -name "*.lua"|xargs sed -i 's/\"nas\"/\"services\"/g'
find package/lean/luci-app-hd-idle/ -name "*.htm"|xargs sed -i 's/\"nas\"/\"services\"/g' 
find package/lean/luci-app-hd-idle/ -name "*.htm"|xargs sed -i 's/admin\/nas/admin\/services/g'
find package/lean/luci-app-hd-idle/ -name "*.lua"|xargs sed -i 's/admin\/nas/admin\/services/g'

make defconfig
