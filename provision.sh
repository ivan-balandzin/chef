#!/bin/bash
yum install -y /vagrant/installs/chefdk-0.12.0-1.el6.x86_64.rpm
cp /vagrant/installs/jboss-5.1.0.GA.zip /opt
cp -R /vagrant/.chef ~/
cp -R /vagrant/cookbooks ~/
sudo chef-solo -c /root/.chef/solo.rb |tee /vagrant/chef.log
