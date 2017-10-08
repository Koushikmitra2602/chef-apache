#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'httpd' do
  action :install
  retries 3
end

remote_file '/var/www/html/koushik.png' do
  source 'https://i.ytimg.com/vi/DodvgIMVsfY/maxresdefault.jpg'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    :name => 'Koushik Mitra'
  )
  action :create
end

service 'httpd' do
  action [ :enable, :start]
  retries 3
end
