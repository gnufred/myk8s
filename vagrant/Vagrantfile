require 'json'
box = JSON.parse(File.read(File.join(__dir__, '.lfs/boxes/alpine-3.24.3.json')))

Vagrant.configure('2') do |config|

	config.vm.box = box.fetch('name')
	config.vm.box_version = box.fetch('version')
	config.vm.box_architecture = box.fetch('architecture')
	config.vm.box_check_update = false

	# load balancer
	(0..0).each do |i|
		config.vm.define "lb#{i}" do |n|

			n.vm.network :private_network, ip: "10.1.2.1#{i}"

			n.vm.provider 'libvirt' do |v|
				v.memory = 1000
				v.cpus = 1
			end

			n.vm.synced_folder '.lfs/apk/', '/.lfs/apk/', id: 'apk', type: 'rsync'

			n.vm.provision :shell, path: 'prov/def.sh'
			n.vm.provision :ansible, playbook: 'pb/vagrant/main.yml'

		end
	end


	# control plane
	(0..2).each do |i|
		config.vm.define "cp#{i}" do |n|

			n.vm.network :private_network, ip: "10.1.2.2#{i}"

			n.vm.provider :libvirt do |v|
				v.memory = 1800
				v.cpus = 2
			end

			n.vm.synced_folder '.lfs/apk/', '/.lfs/apk/', id: 'apk', type: 'rsync'

			n.vm.provision :shell, path: 'prov/cp.sh'
			n.vm.provision :ansible, playbook: 'pb/vagrant/main.yml'

		end
	end

	# workers
	(0..5).each do |i|
		config.vm.define "wo#{i}" do |n|

			n.vm.provider 'libvirt' do |v|
				v.memory = 1800
				v.cpus = 2
			end

			n.vm.network :private_network, ip: "10.1.2.3#{i}"

			n.vm.synced_folder '.lfs/apk/', '/.lfs/apk/', id: 'apk', type: 'rsync'

			n.vm.provision :shell, path: 'prov/def.sh'
			n.vm.provision :ansible, playbook: 'pb/vagrant/main.yml'
		end
	end

	# nfs storage
	(0..0).each do |i|
		config.vm.define "nf#{i}" do |n|

			n.vm.network :private_network, ip: "10.1.2.4#{i}"

			n.vm.provider 'libvirt' do |v|
				v.memory = 1000
				v.cpus = 1
			end

			n.vm.synced_folder '.lfs/apk/', '/.lfs/apk/', id: 'apk', type: 'rsync'

			n.vm.provision :shell, path: 'prov/def.sh'
			n.vm.provision :ansible, playbook: 'pb/vagrant/main.yml'

		end
	end

end
