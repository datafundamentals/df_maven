directory "/etc/profile.d" do 
	mode "0755" 
end
file "/etc/profile.d/maven.sh" do 
	content "export MAVEN_HOME=/usr/local/maven/apache-maven-3.1.1 \n export PATH=$PATH:$MAVEN_HOME/bin"
	owner "root" 
	action :create
end