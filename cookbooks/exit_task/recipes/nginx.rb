template "/etc/yum.repos.d/nginx.repo" do
	source "nginx.repo.erb"
end

package "nginx"

template "/etc/nginx/conf.d/virtual.conf" do
	source "virtual.erb"
	variables({
		"nginx_port" => node["nginx"]["port"],
		"jenkins_port" => node["jenkins"]["port"],
		"tomcat_port" => node["tomcat"]["port"],
		"jenkins_prefix" => node["jenkins"]["prefix"]
		})
end

service "nginx" do
	action [ :enable, :start]
end