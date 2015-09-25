#
# Cookbook Name:: ruby_compile
# Spec:: source
#

require 'spec_helper'

describe 'ruby_compile::source' do
  context 'When all attributes are default, on Ubuntu platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => 'ubuntu', :version => '14.04')
      runner.converge(described_recipe)
    end

    %w{
      git-core curl zlib1g-dev zlib1g build-essential libssl-dev
      libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev
      libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
    }.each do |pkg|
      it "installs #{pkg} package" do
        expect(chef_run).to install_package(pkg)
      end
    end

    it 'downloads ruby source code file' do
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:exist?).with('/usr/local/bin/ruby').and_return(false)
      expect(chef_run).to create_remote_file(chef_run.node.ruby_compile.source.url).with(
        :source   => chef_run.node.ruby_compile.source.url,
        :path     => chef_run.node.ruby_compile.source.src_filepath,
        :checksum => chef_run.node.ruby_compile.source.checksum
      )
    end

    it 'executes bash command to unarchive ruby source' do
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:exist?).with('/usr/local/bin/ruby').and_return(false)
      expect(chef_run).to run_bash('unarchive_ruby_source')
    end

    it 'executes bash command to ruby source' do
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:exist?).with('/usr/local/bin/ruby').and_return(false)
      expect(chef_run).to run_bash('compile_ruby')
    end

    it 'installs bundler gem' do
      expect(chef_run).to install_gem_package('bundler')
    end
  end
end
