require 'serverspec'
set :backend, :exec

describe "packages are installed" do
	it "nginx, git, jenkins and java are installed" do
		expect(package('nginx')).to be_installed
		expect(package('jenkins')).to be_installed
		expect(package('java-1.7.0-openjdk-devel')).to be_installed
		expect(package('git')).to be_installed
	end
end
describe "services is running" do
	it "nginx,tomcat and jenkins services" do
		expect(service("nginx")).to be_enabled
		expect(service("jenkins")).to be_enabled
		expect(service("tomcat")).to be_enabled
		expect(service("nginx")).to be_running
		expect(service("jenkins")).to be_running
		expect(service("tomcat")).to be_running
	end
	it "nginx, tomcat and jenkins ports" do
		expect(port(8080)).to be_listening
		expect(port(8090)).to be_listening
		expect(port(8091)).to be_listening
	end
end
describe command('ls /opt/apache-tomcat-7.0.61') do
	its(:stdout) { should match /conf/ }
	its(:stdout) { should match /bin/ }
	its(:stdout) { should match /webapps/ }
end
describe command('cat /etc/nginx/conf.d/virtual.conf') do
	its(:stdout) { should match /mnt-lab/ }
	its(:stdout) { should match /jenkins/ }
end
describe command('ls /var/lib/jenkins/jobs') do
	its(:stdout) { should match /deploy/ }
	its(:stdout) { should match /build/ }
end
