bash "change Logrotate.conf" do
	user "root"
	code <<-EOH
	vDATE=`date '+%Y%m%d'`
	#/etc/logrotate.conf"
	vFIL="/etc/logrotate.conf"
	cp -p $vFIL $vFIL.$vDATE
	sed -i 's/^weekly/daily/g; s/^rotate [45]/rotate 120/g; s/^#compress/compress/g' $vFIL
  EOH
end