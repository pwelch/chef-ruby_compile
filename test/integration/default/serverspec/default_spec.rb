require 'spec_helper'

# Serverspec examples can be found at
# http://serverspec.org/resource_types.html
describe 'ruby::default' do
  describe file('/usr/local/bin/ruby') do
    it { should be_file }
  end
end
