#
# Cookbook:: audit-wrapper
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['os']
when 'linux'
  if node['platform_family'] == 'rhel'
    node.override['audit']['profiles'] = [ {"name" => "CIS-RHL-baseline-L1", "compliance" => "delivery/cis-rhel7-level1-server"},{"name" => "CIS-RHL-baseline-L2", "compliance" => "delivery/cis-rhel7-level2-server"}]
  elsif node['platform_family'] == 'ubuntu'
    node.override['audit']['profiles'] = [ {"name" => "CIS-ubuntu1604-L1", "compliance" => "delivery/cis-ubuntu16.04lts-level1-server"}]
  else
    node.override['audit']['profiles'] = [ {"name" => "linux-baseline", "compliance" => "delivery/linux-baseline"}]
  end
when 'windows'
  node.override['audit']['profiles'] = [ {"name" => "CIS-win2016-L1", "compliance" => "delivery/cis-windows2016rtm-release1607-level1-memberserver"},{"name" => "CIS-wind2016-L2", "compliance" => "delivery/cis-windows2016rtm-release1607-level2-memberserver"}]
end

include_recipe 'audit'
