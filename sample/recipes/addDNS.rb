bash "change Logrotate.conf" do
	user "root"
	code <<-EOH

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
EOF

#chmod 755 /etc/rc.d/init.d/addDNS
#chkconfig --add addDNS
#chkconfig addDNS on
#service addDNS start
	
  EOH
end