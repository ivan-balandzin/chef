execute "tomcat_unarchive" do
	command "tar -xf /opt/apache-tomcat-7.0.69.tar.gz -C /opt/ && chown -R tomcat:tomcat /opt/apache-tomcat-7.0.69"
	action :nothing
end

user "tomcat"

remote_file "/opt/apache-tomcat-7.0.69.tar.gz" do
	source node["tomcat"]["url"]
	checksum node["tomcat"]["checksum"]
	notifies :run, 'execute[tomcat_unarchive]', :immediately
end

template "/etc/init.d/tomcat" do
	source "tomcat.erb"
	mode 0775
	owner 'root'
    group node['root_group']
end

template "/opt/apache-tomcat-7.0.69/conf/server.xml" do
	source "server.erb"
	owner "tomcat"
	group "tomcat"
	variables({
		"tomcat_port" => node["tomcat"]["port"]
		})
end

service "tomcat" do
	action [ :enable, :start]
end
