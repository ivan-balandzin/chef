execute "jenkins_folder_chown" do
	command "chown -R jenkins:jenkins /var/lib/jenkins"
	action :nothing
end

template "/etc/yum.repos.d/jenkins.repo" do
	source "jenkins.repo.erb"
end

package "jenkins"

template "/etc/sysconfig/jenkins" do
  source "jenkins.erb"
  mode 0744
  variables({
  	"jenkins_port" => node["jenkins"]["port"],
  	"jenkins_prefix" => node["jenkins"]["prefix"]
  	})
end

file "/etc/sudoers.d/jenkins" do
	content "Defaults:jenkins	!requiretty
jenkins	ALL=(ALL)	NOPASSWD: ALL"
end

remote_directory "/var/lib/jenkins" do
	source "jenkins"
	action :create_if_missing
	notifies :run, 'execute[jenkins_folder_chown]', :immediately
end

service "jenkins" do
	action [ :enable, :start]
end
