bash "adding service addDNS" do
	user "root"
	code <<-EOH

	sudo rm  /etc/rc.d/init.d/addDNS > /dev/null 2>&1
	touch /etc/rc.d/init.d/addDNS
	cat <<EOF | sudo tee /etc/rc.d/init.d/addDNS

#!/bin/bash
#
# /etc/init.d/addDNS
# Subsystem file for adding extra dns to /etc/resolv.conf
#
# chkconfig: 345 99 01
# description: addDNS server daemon
#
# INSTALLATION TASK
## sudo vi /etc/rc.d/init.d/addDNS
## sudo chmod 755 /etc/rc.d/init.d/addDNS
## sudo chkconfig --add addDNS
## sudo chkconfig addDNS on
## sudo service addDNS start
## cat /etc/resolv.conf

# source function library
. /etc/rc.d/init.d/functions

function vINIT {
	#Remove nameserver 8.8.8.8 + nameserver 8.8.4.4
	sed -i "/Added by service addDNS/d" /etc/resolv.conf 
	sed -i "/Added by systemctl addDNS/d" /etc/resolv.conf 	
	sed -i "/8.8.8.8/d" /etc/resolv.conf 
	sed -i "/8.8.4.4/d" /etc/resolv.conf 
}

start() 
{
	#Add nameserver 8.8.8.8 + nameserver 8.8.4.4
	DNS1="8.8.8.8"
	DNS2="8.8.4.4"
	vINIT
	printf "# Added by service addDNS \n" >> /etc/resolv.conf
	printf "nameserver $DNS1 \n" >> /etc/resolv.conf
	printf "nameserver $DNS2 \n" >> /etc/resolv.conf
}

stop() 
{
	#Remove nameserver 8.8.8.8 + nameserver 8.8.4.4
	echo "addDNS - stopper"
	vINIT	
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		stop
		start
		;;
	*)
		echo $"Usage: $0 {start|stop|restart}"
		;;
esac
exit
EOF
sudo touch /tmp/djura.added-addDNS
sudo /bin/chmod 755 /etc/rc.d/init.d/addDNS
sudo /sbin/chkconfig --add addDNS
sudo /sbin/chkconfig addDNS on
sudo /sbin/service addDNS start

  EOH
end
  