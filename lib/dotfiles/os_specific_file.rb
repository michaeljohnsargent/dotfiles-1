module Dotfiles

  class OsSpecificFile

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
      ".#{basename}"
    end

    def originfile_name
      ::File.basename filename
    end

    def basename
      ::File.basename( filename ).gsub oses_gsub_regex, ''
    end

  end

end
