require 'spec_helper'

describe Dotfiles::BackupFile do

  it "should include Dotfiles::BackupFileish" do
    described_class.should include( Dotfiles::BackupFileish )
  end

  it "should include Dotfiles::Dotfileish" do
    described_class.should include( Dotfiles::Dotfileish )
  end

end
