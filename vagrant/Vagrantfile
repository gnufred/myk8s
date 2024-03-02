Vagrant.configure("2") do |config|

	config.vm.define "cp1" do |cp1|
		cp1.vm.box = "generic/alpine319"
		cp1.vm.network "forwarded_port", guest: 6443, host: 6447
		cp1.vm.provider "libvirt" do |v|
			v.memory = 1800
			v.cpus = 2
		end
		cp1.vm.provision "shell" do |shell|
			shell.path = "pb/alpine319.sh"
		end
		cp1.vm.provision "ansible" do |ansible|
			ansible.playbook = "pb/vagrant.yml"
		end
	end

	config.vm.define "wo1" do |wo1|
		wo1.vm.box = "generic/alpine319"
		wo1.vm.provider "libvirt" do |v|
			v.memory = 1800
			v.cpus = 2
		end
		wo1.vm.provision "shell" do |shell|
			shell.path = "pb/alpine319.sh"
		end
		wo1.vm.provision "ansible" do |ansible|
			ansible.playbook = "pb/vagrant.yml"
		end
	end

end
