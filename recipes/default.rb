#
# Cookbook Name:: df_maven
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#


# downloads and installs java to be used on the system.
# the community recipe sets the JAVA_HOME on its own. if using a different cookbook you might have to write it on your own.
# include_recipe "df_java::default"

directory "/usr/local/maven" do 
	user "csreirj"
	mode "0755"
	recursive true
	action :create 
end

# downloads the maven rpm from the website
remote_file "/usr/local/maven/apache-maven-3.1.1-bin.tar.gz" do 
	source node['df_maven']['source']
	owner "root" 
	group "root"
	mode "0755" 
	action :create_if_missing
end

# unzips the file which distributes the directories
execute "unzip_file" do 
	cwd "/usr/local/maven" 
	command "tar -xzvf apache-maven-3.1.1-bin.tar.gz" 
	action :run
end
# sets the maven home in a different recipe 
include_recipe "df_maven::set_maven_home"

# puts maven in the PATH so it can run as a program
# node['path'] is in the default attributes

