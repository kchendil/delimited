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


execute "Stop the Delmiited text driver" do
 user "root" 
 command "dxcmd -user admin.servers.system -host localhost -password novell123$ -port 524 -stop \"Delimited Text Driver_33.driverset1.system\"; sleep 20" 
  action :run
end

# execute "Start the Delmiited text driver" do
 # user "root" 
 # command "dxcmd -user admin.servers.system -host localhost -password novell123$ -port 524 -start \"Delimited Text Driver_33.driverset1.system\"" 
  # action :run
# end




