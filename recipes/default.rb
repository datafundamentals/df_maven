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
include_recipe "java"

# downloads the maven rpm from the website
remote_file "/home/vagrant/apache-maven-3.1.1-bin.tar.gz" do 
	source node['df_maven']['source']
	owner "root" 
	group "root"
	mode "0755" 
	action :create_if_missing
end

# unzips the file which distributes the directories
execute "unzip_file" do 
	cwd "/home/vagrant" 
	command "tar -xzvf apache-maven-3.1.1-bin.tar.gz" 
	action :run
end
# sets the maven home in a different recipe 
include_recipe "df_maven::set_maven_home"

# puts maven in the PATH so it can run as a program
# node['path'] is in the default attributes


file node['path_file'] do 
	new_lines = "export PATH=$PATH:$MAVEN_HOME/bin"
	only_if do
		current_content = File.read("#{node['path_file']}")
		current_content.index("MAVEN_HOME").nil?
	end

	current_content = File.read("#{node['path_file']}")
	new_content = current_content + new_lines
	content "#{new_content}\n"
end