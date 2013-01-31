require 'erb'

module Dotfiles

  autoload :BackupDirectory,   'dotfiles/backup_directory'
  autoload :BackupFile,        'dotfiles/backup_file'
  autoload :BackupFileFactory, 'dotfiles/backup_file_factory'
  autoload :BackupFileish,     'dotfiles/backup_fileish'
  autoload :Config,            'dotfiles/config'
  autoload :Directory,         'dotfiles/directory'
  autoload :File,              'dotfiles/file'
  autoload :Dotfileish,        'dotfiles/dotfileish'
  autoload :GeneratedFile,     'dotfiles/generated_file'
  autoload :OsSpecificFile,    'dotfiles/os_specific_file'
  autoload :Setup,             'dotfiles/setup'
  autoload :FileFactory,       'dotfiles/file_factory'
  autoload :VERSION,           'dotfiles/version'

  def self.config
    @@config ||= Config.new
  end

end
