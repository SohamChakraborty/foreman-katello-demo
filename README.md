This is the Vagrant environment that I used for testing foreman with katello. There are few quirks that I hope to note down as we progress.

You can run the vagrant vms by doing: 

`$ vagrant up --no-parallel`

The `generic/centos7` vagrant box doesn't automatically configure the private network only adapter. Therefore that has to be configured from the `provisions.sh` script. I intend to move that to ansible at some later point.

Once the `foremankatellodemo.example.com` vm is up and running, execute the following steps:
