Vagrant.configure(2) do |config|
	config.vm.box = "Chef.box"
	config.vm.network :private_network, ip: "192.168.56.30"

	config.vm.hostname = "ChefET"
  
	config.vm.provider "virtualbox" do |vb|
		vb.name = "ChefET"
                vb.customize ["modifyvm", :id, "--memory", 2048]
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	end
end
