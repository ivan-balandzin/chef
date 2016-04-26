execute "maven_unarchive" do
	command "tar -xf /opt/apache-maven-3.3.9-bin.tar.gz -C /opt/"
	action :nothing
end

remote_file "/opt/apache-maven-3.3.9-bin.tar.gz" do
	source node["maven"]["url"]
	checksum node["maven"]["checksum"]
	notifies :run, 'execute[maven_unarchive]', :immediately
end
