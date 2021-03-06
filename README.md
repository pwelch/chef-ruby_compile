## Overview

[![Build Status](https://secure.travis-ci.org/pwelch/chef-ruby_compile.svg)](http://travis-ci.org/pwelch/chef-ruby_compile)

Chef cookbook to install [Ruby](https://www.ruby-lang.org/en/).

This cookbook assumes you want to compile Ruby from source and only have
a single Ruby version on your system.

## Usage

Basic:
```ruby
include_recipe 'ruby_compile::default'
```

Changing Ruby Version:
```ruby
node.default[:ruby_compile][:ruby_version]      = '2.3.1'
node.default[:ruby_compile][:major_version]     = '2.3'
node.default[:ruby_compile][:source][:checksum] = 'b87c738cb2032bf4920fef8e3864dc5cf8eae9d89d8d523ce0236945c5797dcd'
node.default[:ruby_compile][:install_gems]      = %w{ bundler }
node.default[:ruby_compile][:extra_pkgs]        = []
```

Ruby versions updated [here](https://www.ruby-lang.org/en/downloads/).

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Source code available [here](https://github.com/pwelch/chef-ruby_compile)
