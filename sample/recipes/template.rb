bash "OVERSKRIFT aka Change System Greeting" do
  user "root"
  code <<-EOH
	echo "Hello OpsWorks World" >> /etc/motd
	echo "Hello OpsWorks World" >> /etc/motd
	echo "Hello OpsWorks World" >> /etc/motd
  EOH
end
