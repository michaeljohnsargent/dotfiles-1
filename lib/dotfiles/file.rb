module Dotfiles

  class File

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
      ".#{::File.basename filename}"
    end

  end

end
