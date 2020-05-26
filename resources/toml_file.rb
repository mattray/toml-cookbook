resource_name :toml_file

# taken from https://docs.chef.io/resources/file/
property :path, String, name_property: true
property :content, Hash, required: [:create, :create_if_missing]
property :atomic_update, [true, false]
property :backup, [false, Integer]
property :checksum, String
property :force_unlink, [true, false]
property :group, [String, Integer]
property :manage_symlink_source, [true, false]
property :mode, [String, Integer]
property :owner, [String, Integer]

action :create do
  chef_gem 'toml-rb' do
    compile_time true
  end
  require 'toml-rb'

  content = new_resource.content
  toml_content = TomlRB.dump(content)

  file new_resource.path do
    content toml_content
    atomic_update new_resource.atomic_update
    backup new_resource.backup
    checksum new_resource.checksum
    force_unlink new_resource.force_unlink
    group new_resource.group
    manage_symlink_source new_resource.manage_symlink_source
    mode new_resource.mode
    owner new_resource.owner
    action :create
  end
end

action :create_if_missing do
  chef_gem 'toml-rb' do
    compile_time true
  end
  require 'toml-rb'

  content = new_resource.content
  toml_content = TomlRB.dump(content)

  file new_resource.path do
    content toml_content
    atomic_update new_resource.atomic_update
    backup new_resource.backup
    checksum new_resource.checksum
    force_unlink new_resource.force_unlink
    group new_resource.group
    manage_symlink_source new_resource.manage_symlink_source
    mode new_resource.mode
    owner new_resource.owner
    action :create_if_missing
  end
end

action :delete do
  file new_resource.path do
    atomic_update new_resource.atomic_update
    backup new_resource.backup
    force_unlink new_resource.force_unlink
    action :delete
  end
end

action :touch do
  file new_resource.path do
    atomic_update new_resource.atomic_update
    backup new_resource.backup
    checksum new_resource.checksum
    force_unlink new_resource.force_unlink
    group new_resource.group
    manage_symlink_source new_resource.manage_symlink_source
    mode new_resource.mode
    owner new_resource.owner
    action :touch
  end
end
