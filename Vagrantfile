Vagrant.configure("2") do |config|
  config.vm.box = "chef/centos-6.5"
  config.vm.provision :docker do |d|
    d.pull_images "centos:centos6"
  end
  config.vm.provision :shell, path: "setup.sh"
  config.vm.provision :shell, path: "runpacker.sh", privileged: false
  config.vm.provider "virtualbox" do |v|
    v.memory = 1536
  end
end
