require 'spec_helper'

describe Dotfiles::FileFactory do

  let :instance do
    described_class.new filename, :gen_root => gen_root
  end

  let(:gen_root) { "#{File.expand_path '../../..', __FILE__}/tmp/home" }

  it "should include Dotfiles::Dotfileish" do
    described_class.should include( Dotfiles::Dotfileish )
  end

  describe "#to_dotfile" do

    context 'when the file is a standard dotfile' do

      let(:filename) { "#{File.expand_path '../../..', __FILE__}/vimrc.after" }

      it "should return a Dotfiles::File" do
        instance.to_dotfile.should be_a Dotfiles::File
      end

    end

    context 'when the file is a directory' do

      let(:filename) { "#{File.expand_path '../../..', __FILE__}/bin" }

      it "should return a Directory" do
        instance.to_dotfile.should be_a Dotfiles::Directory
      end

    end

    context 'when the file is an OS specific file' do

      let(:filename) { "#{File.expand_path '../../..', __FILE__}/zshrc-osx" }

      it "should return a Dotfiles::OsSpecificFile" do
        instance.to_dotfile.should be_a Dotfiles::OsSpecificFile
      end

    end

    context 'when the file is an Erb file' do

      let(:filename) { "#{File.expand_path '../../..', __FILE__}/gitconfig.erb" }

      it "should return a Dotfiles::GeneratedFile" do
        instance.to_dotfile.should be_a Dotfiles::GeneratedFile
      end

    end

  end

end
