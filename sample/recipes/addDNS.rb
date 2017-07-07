bash "adding Google DNS" do
	user "root"
	code <<-EOH

	vDATE=`date '+%Y%m%d'`
	#/etc/resolv.conf
	vFIL="/etc//etc/resolv.conf"
	cp -p $vFIL $vFIL.chef.$vDATE
	
	chkconfig addDNS off
	chkconfig addDNS --del
	rm  /etc/rc.d/init.d/addDNS > /dev/null 2>&1

	sed -i "/Added by service addDNS/d; /Added by systemctl addDNS/d; /8.8.8.8/d; /8.8.4.4/d" /tmp/resolv.conf
	DNS1="8.8.8.8"
	DNS2="8.8.4.4"
	printf "nameserver $DNS1 \nnameserver $DNS2 \n" >> /etc/resolv.conf
  EOH
end
