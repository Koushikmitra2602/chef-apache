package 'httpd' do
  action :install
  retries 3
end

file '/var/www/html/index.html' do
  content '<html><h1>Hello World!! This is my second cookbook!! :)</h1></html>'
  action :create
end

service 'httpd' do
  action [ :enable, :start]
  retries 3
end
