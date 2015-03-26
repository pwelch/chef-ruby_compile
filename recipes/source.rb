#
# Cookbook Name:: ruby
# Recipe:: source
#

src_url      = node[:ruby][:source][:url]
src_filepath = node[:ruby][:source][:src_filepath]

# Install package dependencies
node[:ruby][:packages].each { |pkg| package pkg }

# Install any extra packages
node[:ruby][:extra_pkgs].each { |pkg| package pkg } if !node[:ruby][:extra_pkgs].empty?

# Get Ruby Source
remote_file src_url do
  source   src_url
  path     src_filepath
  checksum node[:ruby][:source][:checksum]
  not_if { ::File.exist? node[:ruby][:ruby_bin] }
end

# Unarchive Ruby Source
bash 'unarchive_ruby_source' do
  cwd ::File.dirname(src_filepath)
  code <<-EOF
    tar zxf #{::File.basename(src_filepath)} -C #{::File.dirname(src_filepath)}
  EOF
  not_if { ::File.directory?("#{node[:ruby][:source][:cache_filepath]}/ruby-#{node[:ruby][:ruby_version]}") }
end

# Compile Ruby
bash 'compile_ruby' do
  cwd ::File.dirname(src_filepath)
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    cd ruby-#{node[:ruby][:ruby_version]} &&
    ./configure &&
    make && make install
  EOF
  not_if { ::File.exist? node[:ruby][:ruby_bin] }
end

# Install Gems to System Ruby
node[:ruby][:install_gems].each do |gem|
  gem_package gem do
    gem_binary   node[:ruby][:gem_bin]
    compile_time false if respond_to?(:compile_time)
    action       :install
  end
end
