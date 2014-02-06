default['df_maven']['source'] = "file:///vagrant/binaries/apache-maven-3.1.1-bin.tar.gz" 
# default['df_maven']['source'] = "http://apache.claz.org/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz"

case node['platform_family']
when "debian", "ubuntu"
	node.default['path_file'] = "/home/vagrant/.profile"
when "rhel", "centos"
	node.default['path_file'] = "/home/vagrant/.bash_profile"
end