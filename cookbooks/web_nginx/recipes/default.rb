#
# Cookbook Name:: web_nginx
# Recipe:: default
#

web "install nginx" do
  action :install
  provider "web_nginx"
end

web "setup default page" do
  action :setup
  provider "web_nginx"
end
