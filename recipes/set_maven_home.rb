template '/etc/profile.d/mavenInit.sh' do
  source 'mavenInit.sh.erb'
  mode "0777"
end