bash "change Logrotate.conf" do
  user "root"
  code <<-EOH
  vDATE=`date '+%Y%m%d'`
  #/etc/logrotate.conf"
  vFIL="/etc/logrotate.conf"
  cp -p $vFIL $vFIL.$vDATE
  		sed -i 's/weekly/daily/g' $vFIL
		sed -i 's/rotate /#rotate\nrotate 120/g' $vFIL
		sed -i 's/#compress/compress/g' $vFIL
  EOH
end
