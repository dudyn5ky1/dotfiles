IS_VPN=$(scutil --proxy | grep ProxyAutoConfigEnable)

echo $IS_VPN
if [[ $IS_VPN ]]
then
	echo "VPN connected"
else 
	echo "VPN not connected"
fi

