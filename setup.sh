yum update -y
yum install -y wget gzip curl tar unzip

#
# Download packer and install for vagrant user
#
mkdir /home/vagrant/packer
cd /home/vagrant/packer
wget https://dl.bintray.com/mitchellh/packer/0.6.0_linux_amd64.zip
unzip 0.6.0_linux_amd64.zip
echo "export PATH=/home/vagrant/packer:$PATH" > /home/vagrant/.bashrc
chown -R vagrant.vagrant /home/vagrant/packer

#
# rpm build for memecached
#
yum install rpm-build -y
yum install rpmdevtools rpmlint -y
yum install yum-utils -y
yum install gcc-c++ -y
rpmdev-setuptree

cp /vagrant/memcached.spec /root/rpmbuild/SPECS/

cd /root/rpmbuild
cd SOURCES
cp /vagrant/memcached.sysv.patch .
wget http://memcached.org/files/memcached-1.4.17.tar.gz
cd /root/rpmbuild

yum-builddep SPECS/memcached.spec -y
rpmbuild -v -bb --clean SPECS/memcached.spec

cp /root/rpmbuild/RPMS/x86_64/memcached-1.4.17-0.el6.x86_64.rpm /tmp/.

chmod 666 /var/run/docker.sock


