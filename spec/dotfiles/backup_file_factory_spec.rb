require 'spec_helper'

describe Dotfiles::BackupFileFactory, :generate => true  do

  let :instance do
    described_class.new filename, :gen_root => gen_root
  end

  let(:gen_root) { "#{File.expand_path '../../..', __FILE__}/tmp/home" }

  it "should include Dotfiles::Dotfileish" do
    described_class.should include( Dotfiles::Dotfileish )
  end

  describe "#to_backup_file" do

    before :each do
      instance.stub!( :gen_root ).and_return gen_root
      instance.send( :gen_root ).should == gen_root
    end

    after :each do
      cleanup_gen_root
    end

    let(:filename) { "#{gen_root}/#{file}" }

    context 'when the file is a standard backup file' do

      before :each do
        create_file_at_gen_root file
        ::File.exists?( "#{gen_root}/#{file}" ).should be_true
      end

      let(:file) { ".predotfiles--gitconfig" }

      it "should return a Dotfiles::BackupFile" do
        instance.to_backup_file.should be_a Dotfiles::BackupFile
      end

    end

    context 'when the file is a backup directory' do

      before :each do
        create_dir_at_gen_root file
        ::File.exists?( "#{gen_root}/#{file}" ).should be_true
      end

      let(:file) { ".predotfiles--bin" }

      it "should return a Dotfiles::BackupFile" do
        instance.to_backup_file.should be_a Dotfiles::BackupDirectory
      end

    end

  end

end
