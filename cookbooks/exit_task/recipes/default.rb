#
# Cookbook Name:: exit_task
# Recipe:: default
#

include_recipe "exit_task::java_and_preinstall"
include_recipe "exit_task::nginx"
include_recipe "exit_task::tomcat"
include_recipe "exit_task::jenkins"
include_recipe "exit_task::maven"
