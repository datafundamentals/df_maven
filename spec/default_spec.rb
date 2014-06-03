require 'spec_helper'

describe "df_maven::default" do 
	let(:chef_run) {ChefSpec::Runner.new.converge(described_recipe)}
	it "should unzip the maven binary" do 
		expect(chef_run).to run_execute("tar -xzvf apache-maven-3.1.1-bin.tar.gz")
	end
	it "should also create a config file for the path " do 
		expect(chef_run).to create_file("/etc/profile.d/maven.sh")
	end
end
