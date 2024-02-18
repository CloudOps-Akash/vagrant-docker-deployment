Vagrant.configure("2") do |config|
    # Use same SSH key for each machine
    config.ssh.insert_key = false
    config.vm.box_check_update = false
    
      #server configuration
      config.vm.define "server" do |server|
        server.vm.box = "ubuntu/focal64" # Use Ubuntu 20.04 LTS box
        server.vm.hostname = "server"
        server.vm.network "private_network", ip: "192.168.65.153"
    
        server.vm.provider "virtualbox" do |server|
          server.memory = "1024"
          server.cpus = 1
      end
        # Provisioning script
      server.vm.provision "shell", inline: <<-SHELL
      apt-get update -y
      apt-get install docker.io -y
      mkdir Groot
    SHELL
    
    server.vm.provision "shell", inline: <<-SHELL
      cd /home/vagrant/Groot
      cp -r /vagrant/html/ /home/vagrant/Groot/
      cp /vagrant/Dockerfile /home/vagrant/Groot/
      cp /vagrant/deploy_app.sh /home/vagrant/Groot/
      cp /vagrant/remote_execute.sh /home/vagrant/Groot/
      cp /vagrant/secure_transfer.sh /home/vagrant/Groot/
      cp /vagrant/nginx.conf /home/vagrant/Groot/

      sudo docker build -t web-app .
      sudo docker save web-app > web-app.tar
      echo "192.168.65.153 server" | sudo tee -a /etc/hosts; \
      echo "192.168.65.154 client1" | sudo tee -a /etc/hosts; \
      echo "192.168.65.155 client2" | sudo tee -a /etc/hosts
    SHELL
      end
    
    
    #server configuration
      config.vm.define "client1" do |client1|
        client1.vm.box = "ubuntu/focal64" # Use Ubuntu 20.04 LTS box
        client1.vm.hostname = "client1"
        client1.vm.network "private_network", ip: "192.168.65.154"
    
        client1.vm.provider "virtualbox" do |client1|
          client1.memory = "1024"
          client1.cpus = 1
        end
          # Provisioning script
      client1.vm.provision "shell", inline: <<-SHELL, run: "always"
      apt-get update -y
      apt-get install docker.io -y
      sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      sudo systemctl restart sshd
    SHELL
    
      # Commands that should run only once
    client1.vm.provision "shell", inline: <<-SHELL
    echo "192.168.65.153 server" | sudo tee -a /etc/hosts; \
    echo "192.168.65.154 client1" | sudo tee -a /etc/hosts; \
    echo "192.168.65.155 client2" | sudo tee -a /etc/hosts
    SHELL
    end
      
      
      #server configuration
      config.vm.define "client2" do |client2|
        client2.vm.box = "ubuntu/focal64" # Use Ubuntu 20.04 LTS box
        client2.vm.hostname = "client2"
        client2.vm.network "private_network", ip: "192.168.65.155"
    
        client2.vm.provider "virtualbox" do |client2|
          client2.memory = "1024"
          client2.cpus = 1
        end
          # Provisioning script
      client2.vm.provision "shell", inline: <<-SHELL, run: "always"
      sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      sudo systemctl restart sshd
    SHELL
    
    # Commands that should run only once
    client2.vm.provision "shell", inline: <<-SHELL
    apt-get update -y  
    apt-get install docker.io -y
      echo "192.168.65.153 server" | sudo tee -a /etc/hosts; \
      echo "192.168.65.154 client1" | sudo tee -a /etc/hosts; \
      echo "192.168.65.155 client2" | sudo tee -a /etc/hosts
    SHELL
      end
    end  