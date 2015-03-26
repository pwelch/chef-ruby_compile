#
# Cookbook Name:: ruby
# Spec:: default
#

require 'spec_helper'

describe 'ruby::default' do
  context 'When all attributes are default, on Ubuntu platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => 'ubuntu', :version => '12.04')
      runner.converge(described_recipe)
    end

    it 'includes the ruby::source recipe' do
      expect(chef_run).to include_recipe('ruby::source')
    end
  end
end
