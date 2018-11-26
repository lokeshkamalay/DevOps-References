[ec2-user@ip-172-31-34-148 ~]$ sudo yum install -y python python-dev python-pip
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos
epel/x86_64/metalink                                                            |  17 kB  00:00:00     
epel                                                                            | 3.2 kB  00:00:00     
rhui-REGION-client-config-server-7                                              | 2.9 kB  00:00:00     
rhui-REGION-rhel-server-releases                                                | 3.5 kB  00:00:00     
rhui-REGION-rhel-server-rh-common                                               | 3.8 kB  00:00:00     
(1/2): epel/x86_64/updateinfo                                                   | 931 kB  00:00:00     
(2/2): epel/x86_64/primary                                                      | 3.6 MB  00:00:00     
epel                                                                                       12718/12718
No package python-dev available.
Resolving Dependencies
--> Running transaction check
---> Package python.x86_64 0:2.7.5-68.el7 will be updated
---> Package python.x86_64 0:2.7.5-76.el7 will be an update
--> Processing Dependency: python-libs(x86-64) = 2.7.5-76.el7 for package: python-2.7.5-76.el7.x86_64
---> Package python2-pip.noarch 0:8.1.2-6.el7 will be installed
--> Running transaction check
---> Package python-libs.x86_64 0:2.7.5-68.el7 will be updated
---> Package python-libs.x86_64 0:2.7.5-76.el7 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

=======================================================================================================
 Package            Arch          Version                Repository                               Size
=======================================================================================================
Installing:
 python2-pip        noarch        8.1.2-6.el7            epel                                    1.7 M
Updating:
 python             x86_64        2.7.5-76.el7           rhui-REGION-rhel-server-releases         94 k
Updating for dependencies:
 python-libs        x86_64        2.7.5-76.el7           rhui-REGION-rhel-server-releases        5.6 M

Transaction Summary
=======================================================================================================
Install  1 Package
Upgrade  1 Package (+1 Dependent package)

Total download size: 7.4 M
Downloading packages:
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
(1/3): python2-pip-8.1.2-6.el7.noarch.rpm                                       | 1.7 MB  00:00:00     
(2/3): python-2.7.5-76.el7.x86_64.rpm                                           |  94 kB  00:00:00     
(3/3): python-libs-2.7.5-76.el7.x86_64.rpm                                      | 5.6 MB  00:00:00     
-------------------------------------------------------------------------------------------------------
Total                                                                   14 MB/s | 7.4 MB  00:00:00     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Updating   : python-libs-2.7.5-76.el7.x86_64                                                     1/5 
  Updating   : python-2.7.5-76.el7.x86_64                                                          2/5 
  Installing : python2-pip-8.1.2-6.el7.noarch                                                      3/5 
  Cleanup    : python-2.7.5-68.el7.x86_64                                                          4/5 
  Cleanup    : python-libs-2.7.5-68.el7.x86_64                                                     5/5 
  Verifying  : python-2.7.5-76.el7.x86_64                                                          1/5 
  Verifying  : python2-pip-8.1.2-6.el7.noarch                                                      2/5 
  Verifying  : python-libs-2.7.5-76.el7.x86_64                                                     3/5 
  Verifying  : python-libs-2.7.5-68.el7.x86_64                                                     4/5 
  Verifying  : python-2.7.5-68.el7.x86_64                                                          5/5 

Installed:
  python2-pip.noarch 0:8.1.2-6.el7                                                                     

Updated:
  python.x86_64 0:2.7.5-76.el7                                                                         

Dependency Updated:
  python-libs.x86_64 0:2.7.5-76.el7                                                                    

Complete!
