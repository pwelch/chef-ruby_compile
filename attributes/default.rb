#
# Cookbook Name:: ruby
# Attribute:: default
#

default[:ruby][:ruby_version]      = '2.1.5'
default[:ruby][:major_version]     = '2.1'
default[:ruby][:source][:checksum] = '4305cc6ceb094df55210d83548dcbeb5117d74eea25196a9b14fa268d354b100'
default[:ruby][:install_gems]      = %w{ bundler }
default[:ruby][:extra_pkgs]        = []

default[:ruby][:ruby_file]    = "ruby-#{node[:ruby][:ruby_version]}.tar.gz"
default[:ruby][:source][:url] = "http://ftp.ruby-lang.org/pub/ruby/#{node[:ruby][:major_version]}/#{node[:ruby][:ruby_file]}"

default[:ruby][:source][:cache_filepath] = Chef::Config[:file_cache_path] || '/tmp'
default[:ruby][:source][:src_filepath]   = "#{node[:ruby][:source][:cache_filepath]}/#{node[:ruby][:ruby_file]}"

default[:ruby][:ruby_bin] = '/usr/local/bin/ruby'
default[:ruby][:gem_bin]  = '/usr/local/bin/gem'
default[:ruby][:gems_dir] = '/usr/local/lib/ruby/gems/2.1.0/gems'

case node[:platform_family]
when 'rhel', 'fedora'
  default[:ruby][:packages] = %w{ openssl-devel readline readline-devel sqlite-devel zlib zlib-devel }
when 'debian'
  default[:ruby][:packages] = %w{
    git-core curl zlib1g-dev zlib1g build-essential libssl-dev
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev
    libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
  }
end
