#
# Cookbook Name:: apace
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
if node["platform"] == "ubuntu" do
        execute "apt-get update -y"

end

package "apache2" do
       package_name node["apache"]["package"]
end

execute "rm /etc/httpd/conf.d/welcome.conf" do
        only_if do
                File.exist?("etc/httpd/conf.d/welcome.conf")
        end
end
service "httpd" do
action [ :enable, :start ]
end

cookbook_file "/var/www/html/index.html" do
source node["indexfile"]
mode "0644"
end


