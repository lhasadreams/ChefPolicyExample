# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'base'

# Where to find external cookbooks:
default_source :supermarket, "https://supermarket.chef.io" do |s|
    s.preferred_for "compat_resource", "windows", "powershell", "ms_dotnet45", "chef-client", "ms_dotnet2", "ms_dotnet", "ohai", "logrotate", "cron", "chef_handler", "ms_dotnet4"
  end
# default_source :chef_repo, "../"

# run_list: chef-client will run these recipes in the order specified.
run_list 'chef-client::default'

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'
# cookbook "chef-client", "= 10.0.5"
# cookbook "cron", "= 6.1.1"
# cookbook "logrotate", "= 2.2.0"
# cookbook "windows", "= 4.3.2"

# Set attributes
default['chef_client']['interval']    = '120'
default['chef_client']['splay']       = '30'