Vagrant.configure(2) do |config|
	config.vm.box = "Chef.box"
	config.vm.network :private_network, ip: "192.168.56.20"

	config.vm.hostname = "Chef3"
  
	config.vm.provider "virtualbox" do |vb|
		vb.name = "Chef3"
                vb.customize ["modifyvm", :id, "--memory", 2048]
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	end
end
