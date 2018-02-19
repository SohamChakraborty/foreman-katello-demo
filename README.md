### This is the experimental branch of converting my provisioner scripts to ansible. There are many components which are broken. Don't use this. ###

This is the Vagrant environment that I used for testing foreman with katello. There are few quirks that I hope to note down as we progress.

You can run the vagrant vms by doing: 

`$ vagrant up --no-parallel`

The `generic/centos7` vagrant box doesn't automatically configure the private network only adapter. Therefore that has to be configured from the `provisions.sh` script. I intend to move that to ansible at some later point.

Once the `foremankatellodemo.example.com` vm is up and running, execute the following steps:

The foremanclient6.example.com vm once registered with the katello server, can't get content from outside. The amount of customization is limited too. Therefore if any content is coming from the katello server and the playbook asks to install the same package from outside, it will fail.
