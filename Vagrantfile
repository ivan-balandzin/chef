Vagrant.configure(2) do |config|
	config.vm.provision "shell", path: "provision.sh"
	config.vm.box = "Chef.box"
	config.vm.network :private_network, ip: "192.168.56.10"

	config.vm.hostname = "Chef"
  
	config.vm.provider "virtualbox" do |vb|
		vb.name = "Chef"
                vb.customize ["modifyvm", :id, "--memory", 2048]
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	end
end
