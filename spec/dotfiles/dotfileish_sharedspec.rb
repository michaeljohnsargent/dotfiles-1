require 'spec_helper'

shared_examples_for 'Dotfileish' do

  %w(
    dotfile_path
    filename
  ).each do |method|

    describe "##{method}" do

      subject { instance.send method }

      it { should == send( method ) }

    end

  end

  %w(
    directory
    erb
    exists
    generated
    hidden
    os_specific
    symlink
  ).each do |method|

    describe "##{method}?" do

      subject { instance.send "#{method}?" }

      it { should == send( "#{method}?" ) }

    end

  end

end
