require 'spec_helper'
require File.expand_path( "#{File.dirname __FILE__}/dotfileish_sharedspec" )

describe Dotfiles::OsSpecificFile, :generate => true do

  after :each do
    cleanup_gen_root
  end

  let :instance do
    described_class.new filename, :gen_root => gen_root
  end

  let(:filename) { "#{File.expand_path '../../..', __FILE__}/zshrc-osx" }

  let(:gen_root) { "#{File.expand_path '../../..', __FILE__}/tmp/home" }

  let(:root) { ::File.expand_path( '../../..', __FILE__ ) }

  let(:dotfile_name) { '.zshrc' }

  let(:backup_filename) { '.predotfiles--zshrc' }

  it "should include Dotfiles::Dotfileish" do
    described_class.should include( Dotfiles::Dotfileish )
  end

  %w(
    backup_filename
    dotfile_name
    gen_root
    root
  ).each do |method|

    describe "##{method}" do

      subject { instance.send method }

      it { should == send( method ) }

    end

  end

  #it_should_behave_like 'Dotfileish' do
    #before :each do
      #create_dir_at_gen_root 'bin'
    #end

    #let(:filename)        { "#{File.expand_path '../../..', __FILE__}/bin" }
    #let(:instance)        { described_class.new filename, :gen_root => gen_root }
    #let(:directory?)      { true }
    #let(:erb?)            { false }
    #let(:exists?)         { true }
    #let(:generated?)      { false }
    #let(:hidden?)         { false }
    #let(:os_specific?)    { false }
    #let(:symlink?)        { false }
    #let(:dotfile_path)    { File.join( gen_root, 'bin' ) }
  #end

end
