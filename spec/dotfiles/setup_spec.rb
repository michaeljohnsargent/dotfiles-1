require 'spec_helper'

describe Dotfiles::Setup, :generate => true do

  let :filenames do
    %w(
      bin
      clean-projects.yml
      gemrc.erb
      gitattributes
      gitconfig.erb
      gitexcludes
      gvimrc.after
      gvimrc.before
      irbrc
      railsrc
      rvmrc
      tmux.conf
      vimrc.after
      vimrc.before
      zshrc-osx
    )
  end

  let(:file_paths) { filenames.map { |f| "/Users/cjharrelson/.dotfiles/#{f}" } }

  let(:gen_root) { "#{File.expand_path '../../..', __FILE__}/tmp/home" }

  #describe "#call" do

    #it "should work" do
      #subject.call.should == nil
    #end

  #end

  describe "#current_os" do

    def current_os
      return 'osx' if RUBY_PLATFORM =~ /darwin/
      'unix'
    end

    it "should return the correct current OS" do
      subject.send( :current_os ).should == current_os
    end

  end

  describe "#file_paths" do

    it "should return the correct list" do
      subject.send( :file_paths ).should == file_paths
    end

  end

  describe "#root" do

    it "should return the root of the application" do
      subject.send( :root ).should == File.expand_path( '../../..', __FILE__ )
    end

  end

  describe "#backup_file_paths" do

    before :each do
      subject.stub!( :gen_root ).and_return gen_root
      subject.send( :gen_root ).should == gen_root

      %w(
        .predotfiles--gitconfig
        .predotfiles--symlinks_backup
      ).each do |file|
        create_file_at_gen_root file
        ::File.exists?( "#{gen_root}/#{file}" ).should be_true
      end

    end

    after :each do
      cleanup_gen_root
    end

    it "should return the correct list of files" do
      subject.send( :backup_file_paths ).should == [
        "#{gen_root}/.predotfiles--gitconfig"
      ]
    end

  end

end
