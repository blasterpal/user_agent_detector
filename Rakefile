require 'rake'
require 'spec/rake/spectask'

desc "Run all spec"
Spec::Rake::SpecTask.new('spec') do |t|  
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*.rb']
end 

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "user_agent_detector"
    gemspec.summary = "User Agent Detection Library"
    gemspec.description = "User Agent detection Library"
    gemspec.email = "hank@hankbeaver.com"
    gemspec.homepage = "http://github.com/blasterpal/user_agent_detector"
    gemspec.authors = ["Hank Beaver"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

