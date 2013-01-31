module Dotfiles

  class BackupFileFactory

    include Dotfileish

    def to_backup_file
      return BackupDirectory.new( filename, init_options ) if backup_directory?
      return BackupFile.new( filename, init_options ) if backup_file?
      nil
    end

    def init_options
      {
        :gen_root => gen_root
      }
    end

  end

end
