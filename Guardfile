guard 'bundler' do
  watch('Gemfile')
end

guard(
  :rspec,
  cmd: 'bundle exec rspec --format doc --order defined',
  all_after_pass: true,
  all_on_start: true,
  run_all: { cmd: 'bundle exec rspec --format progress --order random' }
) do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^metadata\.rb$}) { "spec" }
  watch(%r{^attributes/.*\.rb$}) { "spec" }
  watch(%r{^(attributes|definitions|libraries|providers|recipes|resources)/(.+)\.rb$})     { |m| "spec/#{m[1]}/#{m[2]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
