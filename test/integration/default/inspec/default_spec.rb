# Inspec examples can be found at
# https://docs.chef.io/inspec.html

describe file('/usr/local/bin/ruby') do
  it { should be_file }
end
