module Dotfiles

  class FileFactory

    include Dotfileish

    def to_dotfile
      return OsSpecificFile.new( filename, init_options ) if os_specific?
      return Directory.new( filename, init_options ) if directory?
      return GeneratedFile.new( filename, init_options ) if erb?
      File.new filename, init_options
    end

    def init_options
      {
        :gen_root => gen_root
      }
    end

  end

end
