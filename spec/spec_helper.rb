require 'chefspec'
require 'chefspec/berkshelf'
$: << ::File.expand_path('../../libraries', __FILE__)

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'

  # Any example that has the tag :encrypted_data_bag
  # will use `fake_data_bag` instead of the real item.
  #
  # Use `let(:fake_data_bag)` to set your fake data bag.
  config.before(:each, :encrypted_data_bag) do
    Chef::Recipe.
      any_instance.
      stub(:encrypted_data_bag_item).
      with(anything, anything).
      and_return(fake_data_bag)
  end
end
