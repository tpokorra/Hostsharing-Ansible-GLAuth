Hostsharing-Ansible-GLAuth
============================

This Ansible playbook will install the latest GLAuth release on a server from www.hostsharing.net.

To use these modules we have to create a file named ".hsadmin.properties" in the home directory of the package admins. Into that file we have to insert the packagename and password of the package admin. 

Example:

    xyz00@h99:~$ cat .hsadmin.properties 
    xyz00.passWord=insertpkgadminpasswordhere

This file should be protected, else it would be world readable:

    xyz00@h99:~$ chmod 600 .hsadmin.properties

We clone this git-repo to our machine:

    $ git clone https://github.com/tpokorra/Hostsharing-Ansible-GLAuth.git

Then we change the working directory:

    $ cd Hostsharing-Ansible-GLAuth

All needed parameters can be set in the inventory file now. Change xyz00 to the name of your package admin. Set the name of a domain, a new user and a password. We can edit the inventory file with:

    $ cp inventory-sample.yml inventory.yml
    $ vim inventory.yml
    
The option -i can be used to read this inventory file instead of the /etc/ansible/hosts file. We want to login with an SSH-Key. We run:

    $ ansible-playbook -i inventory.yml playbook-install.yml

Now we can connect with ldapsearch locally:

    ldapsearch  -H ldap://127.0.0.1:11111 -D cn=hackers,ou=superheros,dc=glauth,dc=com -w dogood -b dc=glauth,dc=com cn=hackers
    ldapsearch  -H ldap://127.0.0.1:11111 -D cn=serviceuser,ou=svcaccts,dc=glauth,dc=com -w mysecret -b dc=glauth,dc=com cn=hackers
   

--- Open Source Hosting ---
 https://www.hostsharing.net
