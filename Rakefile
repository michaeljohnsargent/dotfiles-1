#require "bundler/gem_tasks"
require 'dotfiles'

desc "Create symbolic links in #{ENV['HOME']} to files in #{::File.expand_path '..', __FILE__}"
task :setup do
  Dotfiles::Setup.new.call
end

desc "Executes: 'rake setup'"
task '' => :setup

namespace :setup do

  desc "Reverts what setup does"
  task :revert do
    Dotfiles::Setup.new.revert
  end

  desc "Cleans up the backup files created by setup"
  task :clean do
    Dotfiles::Setup.new.clean
  end

end

task :default => :setup
