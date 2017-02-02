# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  org = 'openblog'
  config.vm.box = 'postgres_ruby'
  config.vm.box_url = 'http://devops.cloudspace.com/images/ruby-postgresql/ruby-postgresql.box'
  config.ssh.forward_agent = true
  config.vm.network 'private_network', ip: '33.33.33.55'
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.synced_folder '.', "/srv/#{org}", :nfs => true

  config.vm.provider "virtualbox" do |v|
    v.customize [
      "modifyvm", :id,
      "--memory", "2048",
      "--name", "#{org}",
      "--cpus", "2",
      "--usb", "off",
      "--usbehci", "off"
    ]
  end

  config.vm.provision "shell", inline: <<-SCRIPT
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y postfix xvfb fontconfig libxrender1 xfonts-base xfonts-75dpi xfonts-utils libfontenc1 x11-common xfonts-encodings libxfont1 libasound2 libgtk2.0-0

    wget https://ftp.mozilla.org/pub/firefox/releases/44.0/linux-x86_64/en-US/firefox-44.0.tar.bz2
    tar -jxvf firefox-44.0.tar.bz2
    sudo mv -f firefox /opt/
    sudo chown -R root:users /opt/firefox
    sudo chmod 750 /opt/firefox
    sudo usermod -a -G users vagrant
    sudo ln -sf /opt/firefox/firefox /usr/bin/firefox

  SCRIPT
end
