#https://github.com/awslabs/opsworks-first-cookbook/blob/master/sample/recipes/bash.rb
bash "change system greeting" do
  user "root"
  code <<-EOH
  echo "Hello OpsWorks World" > /etc/motd
  EOH
end