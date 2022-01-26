# ChefPolicyExample

[![Git](https://app.soluble.cloud/api/v1/public/badges/9eb819f8-c767-41bc-9095-ea01db5c9479.svg?orgId=387173487776)](https://app.soluble.cloud/repos/details/github.com/lhasadreams/chefpolicyexample?orgId=387173487776)  
Uses Audit and included Base policy files to configure the Chef-Client and run the Audit cookbook

(1) Create the Base and Audit policy lock files
chef install policies/base.rb
chef install policies/audit.rb
(2) Push the audit policy lock file to your Chef Server, in this case to a Policy Group of dev-grp
chef push dev-grp audit.lock.json
(3) Bootstrap a node or update a node to use the Policy File and Policy Group
knife bootstrap <node FQDN> -i <private ssh key> -N <node-name> -x <username> --sudo --policy-group dev-grp --policy-name audit
or
knife node policy set <node-name> dev-grp audit

The Attribites of the base.rb policy file set hopw often the chef-client runs
default['chef_client']['interval']    = '120'
default['chef_client']['splay']       = '30'

The default recipe of the Audit Wrapper cookbook sets the Compliance profile to run dependant on what operating system the node is.
For example for Ubuntu:
node.override['audit']['profiles'] = [ {"name" => "CIS-ubuntu1604-L1", "compliance" => "delivery/cis-ubuntu16.04lts-level1-server"}]
You need to go into the Chef Automate GUI and "Get" the CIS Compliance profiles that you require to run.
Asset Store -> Click on Available and then get the profile(s) you require.
Then click on profiles and adjust the default recipe of the Audit cookbook to use the correct identifier.


