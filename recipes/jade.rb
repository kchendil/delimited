#
# Cookbook Name:: jade
# Recipe:: default
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

template "/var/novell/groups.csv" do
  source "groups.csv.erb"  
  mode "0644"  
end


template "/var/novell/buildingaccess.csv" do
  source "buildingaccess.csv.erb"  
  mode "0644"  
end

template "/var/novell/parkingpasses.csv" do
  source "parkingpasses.csv.erb"  
  mode "0644"  
end

template "/var/novell/securitylevel.csv" do
  source "securitylevel.csv.erb"  
  mode "0644"  
end

execute "Install Jade Entitlement package" do
 user "root" 
 command "/bin/sh -c 'ulimit -n 4096; LD_LIBRARY_PATH=/opt/novell/idm/Designer/plugins/com.novell.core.iconeditor_4.0.0.201206110753/os/linux:/opt/novell/idm/Designer/plugins/com.novell.core.jars_4.0.0.201206110753/os/linux/x86:/opt/novell/idm/Designer/plugins/com.novell.core.jars_4.0.0.201206110753/os/linux/gcc3:$LD_LIBRARY_PATH \"/opt/novell/idm/Designer//Designer\" -nosplash -nl en -application com.novell.idm.rcp.DesignerHeadless -command deployDriver -p \"/opt/novell/idm/Designer//packages/eclipse/plugins\":\"/tmp/plugins\" -a \"admin.servers.system\" -w novell123$ -s 127.0.0.1:524 -c \"driverset1.system\" -b \"NOVLDTXTBASE:NOVLDTXTENT;NOVLDTXTBASE:NOVLACOMSET\" -l \"/var/opt/novell/idm/delimited_entitlement.log\" -u IDM4_16'"
  action :run
end




