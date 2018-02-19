# https://github.com/garystafford/foreman-vagrant
# -*- mode: ruby -*-
# vi: set ft=ruby :

# read vm and chef configurations from JSON files
nodes_config = (JSON.parse(File.read("nodes.json")))['nodes']

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  nodes_config.each do |node|
    node_name   = node[0] # name of node
    node_values = node[1] # content of node

    config.vm.define node_name do |config|
      # configures all forwarding ports in JSON array
      ports = node_values['ports']
      ports.each do |port|
        config.vm.network :forwarded_port,
          host:  port['host'],
          guest: port['guest'],
          id:    port['id']
      end
      config.vm.box = node_values['box']
      config.vm.hostname = node_name
      config.vm.network :private_network, ip: node_values['ip']

      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", node_values['memory']]
        vb.customize ["modifyvm", :id, "--name", node_name]
      end

      if node_name == "foremankatellodemo.example.com"
        config.vm.provision "shell", path: "provisions.sh"
      end
      # config.vm.provision :shell, :path => node_values[':provisions.sh']
    end
  end
end
