# A sample Guardfile
# More info at https://github.com/guard/guard#readme
notification :emacs

guard 'bundler' do
  watch('Gemfile')
end

guard 'rspec', :version => 2, :cli => '--color --profile' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/libs/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

# guard 'cucumber' do
#   watch(%r{^features/.+\.feature$})
#   watch(%r{^features/support/.+$})          { 'features' }
#   watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
# end
