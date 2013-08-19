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



execute "Download Delimited Text Driver shim" do
 user "root"  
 command "wget http://164.99.86.253/publish/Builds/IDM/dorado_sp2_patch3/Drivers/dirxml_flatfile/20130625/dirxmlflatfilefp.zip -O /tmp/dirxmlflatfilefp.zip" 
 not_if { ::File.exists?("/tmp/dirxmlflatfilefp.zip")}
 action :run
end



execute "Unzip the files" do
 user "root" 
 command "cd /tmp/; unzip /tmp/dirxmlflatfilefp.zip" 
 not_if { ::File.exists?("/tmp/dirxmlflatfilefp/linux/novell-DXMLdelim.rpm")}
  action :run
end

execute "Install the rpm" do
 user "root" 
 command "rpm -Uvh /tmp/dirxmlflatfilefp/linux/novell-DXMLdelim.rpm" 
 
  action :run
end

execute "Restart ndsd " do
 user "root" 
 command "/etc/init.d/ndsd restart" 
 
  action :run
end





