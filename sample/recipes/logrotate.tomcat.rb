bash "change Logrotate.tomcat-conf" do
  user "root"
  code <<-EOH
  vSTI01="/etc/logrotate.d"
  vSTI02="/etc/logrotate.elasticbeanstalk.hourly"
  vTOMCAT01="$vSTI01/tomcat $vSTI01/tomcat7 $vSTI01/tomcat8"
  vTOMCAT02="$vSTI01/tomcat8daily $vSTI01/logrotatetomcat*"
  vTOMCAT03="$vSTI01/logrotate.elasticbeanstalk.tomcat8.conf"
  vTOMCAT04="$vSTI02/logrotate.elasticbeanstalk.tomcat8.conf"
  vFILER="$vTOMCAT01 $vTOMCAT02 $vTOMCAT03 $vTOMCAT04"

  for vFIL in $vFILER
  do
    if [ -f $vFIL ]
    then
      printf ".. (EXIST)\t ..modifying \"$vFIL\" ..\n"
	  vDATE=`date '+%Y%m%d'`	  
	  cp -p $vFIL /tmp/$vFIL.$vDATE
      #sed 's/^weekly/daily/g; s/^rotate 4/rotate 120/g; s/^#compress/compress/g' $vFIL
      sed -i 's/^size 10M/size 1G/g; s/^rotate [45]/rotate 120/g; s/^#compress/compress/g; s/^dateext/#dateext/g; s/^dateformat/#dateformat/g' $vFIL
    else
      printf ".. (ERR)\t ..modifying \"$vFIL\" . File doesn't exist..\n"
    fi
  done  
  EOH
end