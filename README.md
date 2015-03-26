## Overview

Chef cookbook to install [Ruby](https://www.ruby-lang.org/en/).

This cookbook assumes you want to compile Ruby from source and only have
a single Ruby version on your system.

## Usage

Basic:
```ruby
include_recipe 'ruby::default'
```

Changing Ruby Version:
```ruby
node.default[:ruby][:ruby_version]      = '2.2.1'
node.default[:ruby][:major_version]     = '2.2'
node.default[:ruby][:source][:checksum] = '5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c7819ab28'
node.default[:ruby][:install_gems]      = %w{ bundler }
node.default[:ruby][:extra_pkgs]        = []
```

Ruby versions updated [here](https://www.ruby-lang.org/en/downloads/).

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Source code availabe [here](https://github.com/pwelch/chef-ruby)
