#
# Cookbook Name:: ruby_compile
# Spec:: default
#

require 'spec_helper'

describe 'ruby_compile::default' do
  context 'When all attributes are default, on Ubuntu platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => 'ubuntu', :version => '14.04')
      runner.converge(described_recipe)
    end

    it 'includes the ruby_compile::source recipe' do
      expect(chef_run).to include_recipe('ruby_compile::source')
    end
  end
end
