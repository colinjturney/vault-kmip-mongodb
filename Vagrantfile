BOX_IMAGE = "bento/ubuntu-20.04"

Vagrant.configure("2") do |config|

  config.vm.define "mongodb" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "mongodb"
    subconfig.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id,'--memory', '1024']
    end
    subconfig.vm.provision "shell", path: "install-mongodb.sh"
    subconfig.vm.provision "shell", path: "start-mongodb.sh"
  end
end
