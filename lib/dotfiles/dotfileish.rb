module Dotfiles

  module Dotfileish

    attr_reader :filename, :gen_root

    def initialize( filename, options={} )
      @filename = filename
      @gen_root = options[:gen_root]

      if @gen_root.nil? || @gen_root.empty?
        raise 'You must provide a :gen_root option'
      end
    end

    def symlink
      `ln -nsf #{originfile_path} #{dotfile_path}`
    end

    def unlink
      `unlink #{dotfile_path}` if ::File.exists?( dotfile_path )
    end

    def backup_file_if_necessary
      if needs_file_backup?
        backup_file
      elsif needs_symlink_backup?
        backup_symlink
      end
    end

    def backup_file
      FileUtils.mv dotfile_path, backup_filepath
    end

    def backup_symlink
      ::File.open( backup_symlinks_filepath, 'a' ) do |f|
        f.puts [dotfile_name, read_symlink].join( '->' )
      end
    end

    def root
      ::File.expand_path '../../..', __FILE__
    end

    def dotfile_path
      ::File.join gen_root,
                  dotfile_name
    end

    def directory?
      ::File.directory? filename
    end

    def erb?
      ::File.file?( filename ) && ::File.extname( filename ) == '.erb'
    end

    def os_specific?
      ::File.basename( filename ) =~ oses_regex ?
        true :
        false
    end

    def generated?
      ::File.basename( filename ).include? '-generated'
    end

    def exists?
      ::File.exists? dotfile_path
    end

    def symlink?
      ::File.symlink? dotfile_path
    end

    def hidden?
      dotfile_name[0] == '.'
    end

    def backup_file?
      filename.include? ".predotfiles--"
    end

    def backup_directory?
      backup_file? && ::File.directory?( filename )
    end

    def needs_file_backup?
      exists? && !symlink?
    end

    def needs_symlink_backup?
      exists? && symlink?
    end

    def read_symlink
      symlink? ?
        ::File.readlink( dotfile_path ) :
        nil
    end

    def backup_filename
      "#{predotfiles_prefix}#{basename}"
    end

    def backup_filepath
      ::File.join gen_root,
                  backup_filename
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

    def basename
      ::File.basename filename
    end

    def originfile_name
      basename
    end

    def originfile_path
      ::File.join root,
                  originfile_name
    end

    def oses
      %w(
        osx
        unix
        windows
      )
    end

    def oses_regex
      /#{oses.join('|')}/
    end

    def oses_gsub_regex
      /#{oses.map { |os| "-#{os}" }.join('|')}/
    end

    def symlink_file_message
      msg = "Symlinking #{dotfile_name} -> #{originfile_name}"
      msg << " (backed up original file as #{backup_filename})" if needs_file_backup?
      msg << " (backed up original symlink in #{backup_symlinks_filename})" if needs_symlink_backup?
      msg
    end

    def unlink_file_message
      "Unlinking #{dotfile_name}"
    end

    def info( message )
      puts "#{message}"
    end

    def success( message )
      puts "\x1b[32m#{message}\x1b[0m"
    end

    def warning( message )
      puts "\x1b[31m#{message}\x1b[0m"
    end

  end

end
