module Dotfiles

  class Directory

    include Dotfileish

    def link
      backup_file_if_necessary
      symlink
      success symlink_file_message
    end

    def revert
      unlink
      success unlink_file_message
    end

    def dotfile_name
      ::File.basename filename
    end

    def backup_filename
      #return ".predotfiles--#{basename}" if hidden?
      ".predotfiles--#{basename}"
    end

  end

end
