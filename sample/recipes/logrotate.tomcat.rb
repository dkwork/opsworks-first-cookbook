bash "change Logrotate.conf" do
  user "root"
  code <<-EOH
  #vDATE=`date '+%Y%m%d'`
  #/etc/logrotate.elasticbeanstalk.hourly/logrotate.elasticbeanstalk.tomcat8.conf
  vFIL="/etc/logrotate.elasticbeanstalk.hourly/logrotate.elasticbeanstalk.tomcat8.conf"
  		sed -i 's/weekly/daily/g' $vFIL
		sed -i 's/rotate /#rotate\nrotate 120/g' $vFIL
		sed -i 's/#compress/compress/g' $vFIL
	#/etc/logrotate.d/tomcat8daily
	vFIL="/etc/logrotate.d/tomcat8daily"
		sed -i 's/weekly/daily/g' $vFIL
		sed -i 's/rotate /#rotate\nrotate 120/g' $vFIL
		sed -i 's/#compress/compress/g' $vFIL		
		
  EOH
end