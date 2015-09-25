# rubocop:disable LineLength
#
# Cookbook Name:: ruby_compile
# Attribute:: default
#

default[:ruby_compile][:ruby_version]      = '2.1.5'
default[:ruby_compile][:major_version]     = '2.1'
default[:ruby_compile][:source][:checksum] = '4305cc6ceb094df55210d83548dcbeb5117d74eea25196a9b14fa268d354b100'
default[:ruby_compile][:install_gems]      = %w{ bundler }
default[:ruby_compile][:extra_pkgs]        = []

default[:ruby_compile][:ruby_file]    = "ruby-#{node[:ruby_compile][:ruby_version]}.tar.gz"
default[:ruby_compile][:source][:url] = "http://ftp.ruby-lang.org/pub/ruby/#{node[:ruby_compile][:major_version]}/#{node[:ruby_compile][:ruby_file]}"

default[:ruby_compile][:source][:cache_filepath] = Chef::Config[:file_cache_path] || '/tmp'
default[:ruby_compile][:source][:src_filepath]   = "#{node[:ruby_compile][:source][:cache_filepath]}/#{node[:ruby_compile][:ruby_file]}"

default[:ruby_compile][:ruby_bin] = '/usr/local/bin/ruby'
default[:ruby_compile][:gem_bin]  = '/usr/local/bin/gem'
default[:ruby_compile][:gems_dir] = '/usr/local/lib/ruby/gems/2.1.0/gems'

case node[:platform_family]
when 'rhel', 'fedora'
  default[:ruby_compile][:packages] = %w{ openssl-devel readline readline-devel sqlite-devel zlib zlib-devel }
when 'debian'
  default[:ruby_compile][:packages] = %w{
    git-core curl zlib1g-dev zlib1g build-essential libssl-dev
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev
    libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
  }
end
