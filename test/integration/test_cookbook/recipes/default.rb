# get a big hash
hash1 = {
        'echo': 'foxtrot',
        'golf': "hotel",
        'kilo': %w(lima mike november),
        'alpha': {
                  'bravo': 10,
                  'charlie': 'delta',
                  "october"=> 'pegasus',
                 },
        'india'=> {
                  'juliett': true,
                 },
       }

hash2 = {
        'kilo': %w(november lima mike),
        'india': {
                  'juliett': true,
                 },
        'echo': 'foxtrot',
        'alpha': {
                  'charlie': "delta",
                  "october": 'pegasus',
                  'bravo': 10,
                 },
        'golf': 'hotel',
       }

hash3 = {
        "one.two.three": '123',
        "four.five.six"=> '456',
        'eleven.twelve'=> 1112,
        'seven.eight': {
                  'juliett': "value",
                  'oscar': 14,
                  "clams": 'oysters',
                 },
        "nine.ten": {
                  'juliett': "value",
                  "clams": 'oysters',
                  'oscar': 14,
                  "meyer": "14",
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

toml_file "#{Chef::Config[:file_cache_path]}/test3.toml" do
  owner 'vagrant'
  group 'vagrant'
  mode '0640'
  content hash3
  action :create
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

toml_file "#{Chef::Config[:file_cache_path]}/testX.toml" do
  action :delete
end
