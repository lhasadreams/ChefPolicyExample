# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'audit'

# Where to find external cookbooks:
default_source :supermarket, "https://supermarket.chef.io" do |s|
    s.preferred_for "compat_resource"
  end
default_source :chef_repo, "../"

# Include the base policy
include_policy "base", path: "./base.lock.json"

# run_list: chef-client will run these recipes in the order specified.
run_list ["audit-wrapper::default"]

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'

# Set attributes
default['audit']['fetcher'] = 'chef-server'
default['audit']['reporter'] = 'chef-server-automate'
# default['audit']['inspec_version'] = '1.51.0'