#
# Cookbook Name :: web
# Recipe :: default
#

if node.role?('nginx')
   include_recipe 'web_nginx'

elsif node.role?('apache')
   include_recipe 'web_apache'

end
