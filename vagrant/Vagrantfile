Vagrant.configure("2") do |config|

	config.vm.define "cp1" do |cp1|

		cp1.vm.box = "generic/alpine319"

		cp1.vm.synced_folder ".lfs", "/.lfs", type: "rsync"

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


	(1..6).each do |i|
		config.vm.define "wo#{i}" do |wo|

			wo.vm.box = "generic/alpine319"

			wo.vm.synced_folder ".lfs", "/.lfs", type: "rsync"

			wo.vm.provider "libvirt" do |v|
				v.memory = 1800
				v.cpus = 2
			end

			wo.vm.provision "shell" do |shell|
				shell.path = "pb/alpine319.sh"
			end

			wo.vm.provision "ansible" do |ansible|
				ansible.playbook = "pb/vagrant.yml"
			end

		end

	end

end
