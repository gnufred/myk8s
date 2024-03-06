Vagrant.configure("2") do |config|


	(0..0).each do |i|
		config.vm.define "cp#{i}" do |cp|

			cp.vm.box = "generic/alpine319"

			cp.vm.synced_folder ".lfs", "/.lfs", type: "rsync"

			cp.vm.provider "libvirt" do |v|
				v.memory = 1800
				v.cpus = 2
			end

			cp.vm.provision "shell" do |shell|
				shell.path = "pb/alpine319.sh"
			end

			cp.vm.provision "ansible" do |ansible|
				ansible.playbook = "pb/vagrant.yml"
			end
		end
	end


	(0..5).each do |i|
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
