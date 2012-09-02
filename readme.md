Installation
------------

In the folder where you like to set up the VM:

    git clone git://github.com/mikey179/vagrant-puppetfiles-php54.git

In your Vagrantfile, add

    config.vm.provision :puppet, :module_path => 'vagrant-puppetfiles-php54/modules'  do |puppet|
      puppet.manifests_path = "vagrant-puppetfiles-php54/manifests"
      puppet.manifest_file  = "default.pp"
    end

Run `vagrant up` to create the new VM instance. It will install PHP 5.4, PEAR, PHPUnit,
PhpDoc2 and Composer on this VM.
