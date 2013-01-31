module Dotfiles

  class Config

    def gen_root
      ::File.expand_path '~'
    end

    def backup_symlinks_filename
      "#{predotfiles_prefix}symlinks_backup"
    end

    def backup_symlinks_filepath
      ::File.join gen_root,
                  backup_symlinks_filename
    end

    def predotfiles_prefix
      ".predotfiles--"
    end

  end

end
