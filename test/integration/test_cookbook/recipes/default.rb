# get a big hash
hash1 = {
        'golf': 'hotel',
        'kilo': %w(lima mike november),
        'india': {
                  'juliett': true,
                 },
        'alpha': {
                  'charlie': 'delta',
                  'bravo': 10,
                 },
        'echo': 'foxtrot',
       }

hash2 = {
        'golf': 'hotel',
        'kilo': %w(lima mike november),
        'india': {
                  'juliett': true,
                  'oscar': 14,
                 },
        'alpha': {
                  'charlie': 'delta',
                  'bravo': 10,
                 },
       }

# write out some TOML
toml_file "#{Chef::Config[:file_cache_path]}/test1.toml" do
  owner 'vagrant'
  group 'vagrant'
  mode '0640'
  content hash1
  action :create
end

toml_file "#{Chef::Config[:file_cache_path]}/test2.toml" do
  owner 'vagrant'
  group 'vagrant'
  mode '0640'
  content hash2
  action :create_if_missing
end

toml_file "#{Chef::Config[:file_cache_path]}/test2.toml" do
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
  content hash2
  action :touch
end

toml_file "NOOP #{Chef::Config[:file_cache_path]}/test1.toml" do
  path "#{Chef::Config[:file_cache_path]}/test1.toml"
  owner 'root'
  group 'root'
  mode '0640'
  content hash1
  action :create_if_missing
end

toml_file "#{Chef::Config[:file_cache_path]}/test3.toml" do
  action :delete
end
