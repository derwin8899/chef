#
# Cookbook:: iis
# Attribute:: default
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
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['iis']['home']       = "#{ENV['WINDIR']}\\System32\\inetsrv"
default['iis']['conf_dir']   = "#{ENV['WINDIR']}\\System32\\inetsrv\\config"
default['iis']['pubroot']    = "#{ENV['SYSTEMDRIVE']}\\inetpub"
default['iis']['docroot']    = "#{ENV['SYSTEMDRIVE']}\\inetpub\\wwwroot"
default['iis']['cache_dir']  = "#{ENV['SYSTEMDRIVE']}\\inetpub\\temp"
default['iis']['components'] = []

default['iis']['source'] = nil

default['iis']['recycle']['log_events'] = 'Time, Requests, Schedule, Memory, IsapiUnhealthy, OnDemand, ConfigChange, PrivateMemory'

default['iis_applications'] = [
    {
        'app_pool_name' => 'site.a.81',
        'host_name' => 'A',
        'restart_time' => '03:00:00',
        'site_name' => 'SITE-A-81',
        'site_path'=> 'C:\\inetpub\\wwwroot\\site_a_81',
        'site_port'=> '81',
        'site_application_pool' => 'site.a.81',
        'site_directory' => 'C:\\inetpub\\wwwroot\\site_a_81'
    },
    {
        'app_pool_name' => 'site.b.82',
        'host_name' => 'B',
        'restart_time' => '03:01:00',
        'site_name' => 'SITE-B-82',
        'site_path'=> 'C:\\inetpub\\wwwroot\\site_b_82',
        'site_port'=> '82',
        'site_application_pool' => 'site.b.82',
        'site_directory' => 'C:\\inetpub\\wwwroot\\site_b_82'
    },
    {
        'app_pool_name' => 'site.c.83',
        'host_name' => 'C',
        'restart_time' => '03:02:00',
        'site_name' => 'SITE-C-83',
        'site_path'=> 'C:\\inetpub\\wwwroot\\site_c_83',
        'site_port'=> '83',
        'site_application_pool' => 'site.c.83',
        'site_directory' => 'C:\\inetpub\\wwwroot\\site_c_83'
    }
]
