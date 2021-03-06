include_recipe 'nginx'

template "#{node[:nginx][:dir]}/sites-available/tile-cache" do
  source 'tile-cache.erb'
  notifies :reload, 'service[nginx]', :delayed
end

template "#{node[:nginx][:dir]}/sites-available/tileserver" do
  source 'tileserver.erb'
  notifies :reload, 'service[nginx]', :delayed
end

nginx_site 'tile-cache'
nginx_site 'tileserver'
