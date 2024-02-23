Vagrant.configure("2") do |config|

	config.vm.define "myk8s" do |myk8s|
		myk8s.vm.box = "generic/ubuntu2204"
		myk8s.vm.network "forwarded_port", guest: 6443, host: 6446
		myk8s.vm.provider "libvirt" do |v|
			v.memory = 1024
			v.cpus = 1
		end
		myk8s.vm.provision "ansible" do |ansible|
			ansible.playbook = "playbook/myk8s/provision/main.yml"
		end
	end

	config.vm.define "walp1" do |walp1|
		walp1.vm.box = "generic/alpine319"
		walp1.vm.provider "libvirt" do |v|
			v.memory = 1800
			v.cpus = 2
		end
		walp1.vm.provision "shell" do |shell|
			shell.path = "playbook/walp1/provision/main.sh"
		end
		walp1.vm.provision "ansible" do |ansible|
			ansible.playbook = "playbook/walp1/provision/main.yml"
		end
	end

end
