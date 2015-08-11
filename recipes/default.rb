

log "debug_print" do 
    "INITIATING MAVEN RUN FROM #{node['df_maven']['download_source']}"
    level :info
end

template '/home/vagrant/README_MAVEN.txt' do 
  source 'README_MAVEN.txt.erb'
  mode "0644"
  only_if { ::File.exists?('/home/vagrant') }
end

template '/home/vagrant/chef_maven_attribute_values.txt' do 
  source 'attribute_values.txt.erb'
  mode "0644"
  only_if { ::File.exists?('/home/vagrant') }
end

directory node['df_maven']['local_dir'] do 
	mode "0755"
	recursive true
	action :create 
end

remote_file node['df_maven']['remote_file'] do 
	source node['df_maven']['download_source']
	#source "http://docs.datafundamentals.com/lib/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz"
	mode "0755" 
	action :create_if_missing
end

execute "unzip_file" do 
	cwd node['df_maven']['local_dir']
	command "tar -xzvf " + node['df_maven']['tar_name']
	action :run
end

include_recipe "df_maven::set_maven_home"
