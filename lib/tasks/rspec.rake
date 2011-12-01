require 'rspec/core/rake_task'

desc("Run all specs in the spec_no_rails directory")
RSpec::Core::RakeTask.new do |t|
  t.name = 'spec:no_rails'
  t.pattern = 'spec_no_rails/**/*_spec.rb'
end

desc "run both rails coupled and non-rails coupled specs"
task :specs => [:spec, 'spec:no_rails']
