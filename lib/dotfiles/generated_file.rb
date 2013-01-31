module Dotfiles

  class GeneratedFile

    include Dotfileish

    def link
      backup_file_if_necessary
      generate
      success symlink_file_message
    end

    def revert
      unlink
      success unlink_file_message
    end

  protected

    def generate
      ::File.open generated_filepath, 'w' do |f|
        f.write ERB.new( ::File.read( filename )).result
      end
    end

    def dotfile_name
      ".#{basename}"
    end

    def originfile_name
      generated_filename
    end

    def basename
      ::File.basename filename, '.erb'
    end

    def generated_filename
      ::File.basename generated_filepath
    end

    def generated_filepath
      "#{filename.gsub( /\.erb/, '' )}-generated"
    end

  end

end
