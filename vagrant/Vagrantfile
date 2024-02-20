Vagrant.configure("2") do |config|
  config.vm.define "myk8s"
  config.vm.box = "generic/ubuntu2204"
  config.vm.network "forwarded_port", guest: 6443, host: 6443
  config.vm.provider "libvirt" do |v|
    v.memory = 1024
    v.cpus = 1
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook/provision/main.yml"
  end
end
