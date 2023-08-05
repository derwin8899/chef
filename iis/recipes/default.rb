#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: iis
# Recipe:: default
#
# Copyright:: 2011-2019, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,v
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

iis_install 'install IIS' do
  additional_components node['iis']['components']
  source node['iis']['source']
end

service 'iis' do
  service_name 'W3SVC'
  action [:enable, :start]
end

node['iis_applications'].each do |app|
  # = "#{app['host_name']}"

  iis_pool "#{app['app_pool_name']}" do
    periodic_restart_schedule "#{app['restart_time']}"
    action [:add, :start, :config]
  end
    
  iis_site "#{app['site_name']}" do
    path "#{app['site_path']}"
    port "#{app['site_port']}"
    application_pool "#{app['site_application_pool']}"
  end

  # directory "#{app['site_directory']}" do
  #   rights :read, 'IIS_IUSRS'
  #   inherits true
  # end

  remote_directory "#{app['site_path']}" do
    source "#{app['site_name']}"
    action :create
    rights :full_control, 'Everyone'
    overwrite true
    recursive true
  end


end
