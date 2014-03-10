source 'https://rubygems.org'

gem 'berkshelf', '~> 3.0.0beta7'
gem 'rainbow', '<= 1.99.1'

group :development, :test do
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop'
  gem 'rubocop-checkstyle_formatter', require: false
  gem 'chefspec'
  gem 'rspec', '~> 2.14'
end

group :development do
  gem 'knife-solo_data_bag'

  gem 'guard', '~> 2.5'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-shell'
  gem 'terminal-notifier-guard', :require => false
end

group :integration do
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
end
