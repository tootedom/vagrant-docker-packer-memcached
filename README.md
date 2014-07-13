This is a sample project that:

- Creates a Vagrant centos vm
- Installs docker and packer on the centos vm
- downloads memcached 1.4.17 (1.4.20's tests would not work)
- compiles memcached, with a patch to the service startup script
- builds the memcached rpm
- runs package to create a docker images that installs that memcached rpm
- the docker image has supervisord installed on it
- saves the image.