require 'spec_helper'

describe file('/usr/local/maven') do 
	it { should be_directory } 
end

describe file('/etc/profile.d/maven.sh') do 
	it { should be_file } 
end
