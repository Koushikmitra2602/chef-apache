#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'httpd' do
  action :install
  retries 3
end

file '/var/www/html/index.html' do
  content "<html>
		<h1>Hello World!! This is my second cookbook!! :)</h1>
		<body>
			HOSTNAME : #{node['ec2']['hostname']}<br>
			PUBLIC IP : #{node['ec2']['public_ipv4']}<br>
			IPADDRESS : #{node['ipaddress']}<br>
			CPU : #{node['cpu']['0']['mhz']}<br>
			MEMORY : #{node['memory']['total']}<br>
		</body>
	   </html>"
  action :create
end

service 'httpd' do
  action [ :enable, :start]
  retries 3
end
