Vagrant.configure('2') do |config|


	# load balancer
	(0..0).each do |i|
		config.vm.define "lb#{i}" do |n|

			n.vm.box = 'generic/alpine319'

			n.vm.network :private_network, ip: "10.1.2.1#{i}"

			n.vm.provider 'libvirt' do |v|
				v.memory = 1000
				v.cpus = 1
			end

			n.vm.synced_folder '.lfs/apk/', '/.lfs/apk/', id: 'apk', type: 'rsync'

			n.vm.provision :shell, path: 'prov/lb.sh'
			n.vm.provision :ansible, playbook: 'pb/vagrant/main.yml'

		end
	end


	# control plane
	(0..2).each do |i|
		config.vm.define "cp#{i}" do |n|

			n.vm.box = 'generic/alpine319'

			n.vm.network :private_network, ip: "10.1.2.2#{i}"

			n.vm.provider :libvirt do |v|
				v.memory = 1800
				v.cpus = 2
			end

			n.vm.synced_folder '.lfs/apk/', '/.lfs/apk/', id: 'apk', type: 'rsync'
			n.vm.synced_folder '.lfs/blobs', '/.lfs/blobs', id: 'blobs', type: 'rsync'

			n.vm.provision :shell, path: 'prov/cp.sh'
			n.vm.provision :ansible, playbook: 'pb/vagrant/main.yml'

		end
	end


	# workers
	(0..5).each do |i|
		config.vm.define "wo#{i}" do |n|

			n.vm.box = 'generic/alpine319'

			n.vm.provider 'libvirt' do |v|
				v.memory = 1800
				v.cpus = 2
			end

			n.vm.network :private_network, ip: "10.1.2.3#{i}"

			n.vm.synced_folder '.lfs/apk/', '/.lfs/apk/', id: 'apk', type: 'rsync'

			n.vm.provision :shell, path: 'prov/wo.sh'
			n.vm.provision :ansible, playbook: 'pb/vagrant/main.yml'
		end
	end

end
