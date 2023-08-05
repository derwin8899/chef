
iis_install 'install IIS' do
  additional_components node['iis']['components']
  source node['iis']['source']
end

service 'iis' do
  service_name 'W3SVC'
  action [:enable, :start]
end

node['iis_applications'].each do |app|

  iis_pool "#{app['app_pool_name']}" do
    periodic_restart_schedule "#{app['restart_time']}"
    action [:add, :start, :config]
  end
    
  iis_site "#{app['site_name']}" do
    path "#{app['site_path']}"
    port "#{app['site_port']}"
    application_pool "#{app['site_application_pool']}"
  end
  
  remote_directory "#{app['site_path']}" do
    source "#{app['site_name']}"
    action :create
    rights :read, 'IIS_IUSRS'
    overwrite false
    recursive true
  end
  
end
