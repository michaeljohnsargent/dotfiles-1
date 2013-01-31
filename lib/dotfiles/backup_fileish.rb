module Dotfiles

  module BackupFileish

    def restore_file_message
      "Restoring file #{filename} to #{original_filename}"
    end

    def restore
      `mv #{filename} #{original_filename}`
      success restore_file_message
    end

    def delete
      FileUtils.rm( filename ) if ::File.exists?( filename )
      success "Removed #{::File.basename( filename )}"
    end

  protected

    # The name of the file prior to backup
    #
    def original_filename
      filename.gsub( /predotfiles--/, '' )
    end

  end

end
