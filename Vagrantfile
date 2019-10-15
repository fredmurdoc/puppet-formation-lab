## Notes:
# Manque: network opérationnel + vagrant.yml pour ansible
#
Vagrant.configure(2) do |config|

  int= "enp0s31f6"
  dns = "192.168.44.1"
  gateway = "172.16.8.254"
  range = "172.16.8.2"
  cidr = "255.255.248.0"

  [
    ["master.formation.lan",   "#{range}1",      "4096",    'ubuntu/xenial64' ],
    ["srv01.formation.lan",    "#{range}2",      "1024",    'ubuntu/xenial64' ],
    ["srv02.formation.lan",    "#{range}3",      "1024",    'centos/7'        ],
    ["web01.formation.lan",    "#{range}4",      "1024",    'ubuntu/xenial64' ],
  ].each do |vmname,ip,mem,os|
    config.vm.define "#{vmname}" do |machine|

      machine.vm.provider "virtualbox" do |v|
        v.memory = "#{mem}"
        v.cpus = 1
        v.name = "#{vmname}"
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--ioapic", "on"]
      end

      machine.vm.box = "#{os}"
      machine.vm.hostname = "#{vmname}"
      machine.vm.network "public_network",bridge: "#{int}",
        ip: "#{ip}",
        netmask: "#{cidr}"
      
      if vmname == "master.formation.lan"
        machine.vm.synced_folder "puppet/production/manifests", "/etc/puppetlabs/code/environments/production/manifests"
      end
      
      machine.vm.provision "file", source: "install_puppet.sh", destination: "$HOME/install_puppet.sh"
      machine.vm.provision "file", source: "configure_puppet.sh", destination: "$HOME/configure_puppet.sh"
      machine.vm.provision :ansible do |ansible|
        # Disable default limit to connect to all the machines
        ansible.limit = "all"
        ansible.compatibility_mode = "2.0"
        ansible.playbook = "vagrant.yml"
      end

      $script = <<-SCRIPT
	echo '#{range}1 master' | sudo tee -a /etc/hosts
	echo '#{ip} #{vmname}' | sudo tee -a /etc/hosts
SCRIPT
      machine.vm.provision "shell" do |s|
	      s.inline = $script
      end

      #machine.vm.provision "shell", inline: "bash /home/vagrant/install_puppet.sh"
      #machine.vm.provision "shell", path: "install_puppet.sh"
    end
  end
end
