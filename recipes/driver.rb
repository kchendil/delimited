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


template "/opt/novell/idm/Designer/NOVLDTXTBASE.properties" do
  source "NOVLDTXTBASE.properties.erb"  
  mode "0644"  
end



execute "Import the project" do
 user "root" 
 command "/bin/sh -c 'ulimit -n 4096; LD_LIBRARY_PATH=/opt/novell/idm/Designer/plugins/com.novell.core.iconeditor_4.0.0.201206110753/os/linux:/opt/novell/idm/Designer/plugins/com.novell.core.jars_4.0.0.201206110753/os/linux/x86:/opt/novell/idm/Designer/plugins/com.novell.core.jars_4.0.0.201206110753/os/linux/gcc3:$LD_LIBRARY_PATH \"/opt/novell/idm/Designer//Designer\" -nosplash -nl en -application com.novell.idm.rcp.DesignerHeadless -command  importIDV -a \"admin.servers.system\" -w n -s 127.0.0.1:524 -c \"driverset1.system\" -u IDM4_14 -l \"/var/opt/novell/idm/import_idv.log\"  '" 
  action :run
end


execute "Create Delimited Text Driver" do
 user "root" 
 command "/bin/sh -c 'ulimit -n 4096; LD_LIBRARY_PATH=/opt/novell/idm/Designer/plugins/com.novell.core.iconeditor_4.0.0.201206110753/os/linux:/opt/novell/idm/Designer/plugins/com.novell.core.jars_4.0.0.201206110753/os/linux/x86:/opt/novell/idm/Designer/plugins/com.novell.core.jars_4.0.0.201206110753/os/linux/gcc3:$LD_LIBRARY_PATH \"/opt/novell/idm/Designer//Designer\" -nosplash -nl en -application com.novell.idm.rcp.DesignerHeadless -command deployDriver -p \"/opt/novell/idm/Designer//packages/eclipse/plugins\":\"/tmp/plugins\" -a \"admin.servers.system\" -w n -s 127.0.0.1:524 -c \"driverset1.system\" -b NOVLDTXTBASE -l \"var/opt/novell/idm/delimited_configure.log\" -u IDM4_14 '" 
  action :run
end




