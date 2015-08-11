default['df_maven']['version'] = "3.2.5"
default['df_maven']['web_lib_source'] = "http://docs.datafundamentals.com/lib/"
default['df_maven']['name'] = "apache-maven-" + node['df_maven']['version'] + "-bin"
default['df_maven']['tar_name'] = node['df_maven']['name'] + ".tar.gz"
default['df_maven']['download_source'] = node['df_maven']['web_lib_source'] + node['df_maven']['tar_name']  
default['df_maven']['local_dir'] = "/usr/local/maven/"
default['df_maven']['remote_file'] = node['df_maven']['local_dir'] + node['df_maven']['tar_name'] 

# This below is from a previous version of this recipe and not sure if it is still valid
case node['platform_family']
when "debian", "ubuntu"
	node.default['path_file'] = "/home/vagrant/.profile"
when "rhel", "centos"
	node.default['path_file'] = "/home/vagrant/.bash_profile"
end