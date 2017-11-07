source 'https://rubygems.org'

gem 'puppet', ENV['PUPPET_VERSION'] || '~> 3.8.0'

gem 'rake', '~> 12.1.0'
gem 'puppet-lint', '~> 2.3.3'
gem 'rspec-puppet', '~> 2.6.9'
gem 'puppetlabs_spec_helper', '~> 2.3.2'
gem 'puppet-syntax', '~> 2.4.1'

group :functional_tests do
  gem 'test-kitchen'
  gem 'kitchen-docker'
  gem 'kitchen-inspec'
  gem 'kitchen-puppet'
end
