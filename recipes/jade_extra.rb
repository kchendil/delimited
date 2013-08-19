#
# Cookbook Name:: jade
# Recipe:: jade_extra
#
# Copyright 2013, Chendil Kumar Manoharan
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

execute "Download Jade extra patches 1" do
 user "root" 
 command "wget http://164.99.178.154/Jade_for_vagrant/init-idm-resources.jar -O /opt/novell/eDirectory/lib/dirxml/classes/init-idm-resources.jar"
  action :run
end



execute "Download Jade extra patches 2" do
 user "root" 
 command "wget http://164.99.178.154/Jade_for_vagrant/opencsv-2.1.jar -O /opt/novell/eDirectory/lib/dirxml/classes/opencsv-2.1.jar"
  action :run
end


execute "Restart ndsd" do
 user "root"
 command "/etc/init.d/ndsd restart" 
  action :run
end

execute "Download Advanced Driver set commond package" do
 user "root" 
 command "mkdir -p /tmp/plugins; cd /tmp/plugins; wget http://164.99.90.247/artifacts/designer_updatesite2/4.0/Publish2/plugins/NOVLACOMSET_2.1.0.20130702145909.jar"
  action :run
end


execute "Download Delimited Text Driver Base package" do
 user "root" 
 command "cd /tmp/plugins; wget http://164.99.90.247/artifacts/designer_updatesite2/4.0/Publish2/plugins/NOVLDTXTBASE_2.1.0.20130801170531.jar"
  action :run
end


execute "Download Jade Entitlement package" do
 user "root" 
 command "cd /tmp/plugins; wget http://164.99.90.247/artifacts/designer_updatesite2/4.0/Publish2/plugins/NOVLDTXTENT_2.1.0.20130801170845.jar"
  action :run
end

