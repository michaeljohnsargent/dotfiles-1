module Dotfiles

  class Setup

    def call
      link_files
      nil
    end

    def revert
      revert_files
      restore_backups
      remove_symlinks_backup_file
      nil
    end

    def clean
      remove_backup_files
      remove_symlinks_backup_file
    end

  protected

    def link_files
      files { |f| f.link }
    end

    def revert_files
      files { |f| f.revert }
    end

    def remove_backup_files
      backup_files { |f| f.delete }
    end

    def restore_backups
      backup_files { |f| f.restore }
      symlink_backups.each { |dest, src| `ln -nsf #{src} #{::File.join( Dotfiles.config.gen_root, dest )}` }
    end

    def files
      file_paths.map do |f|
        file = FileFactory.new( f, file_factory_options ).to_dotfile
        yield file if block_given?
      end
    end

    def backup_files
      backup_file_paths.each do |f|
        file = BackupFileFactory.new( f, file_factory_options ).to_backup_file
        yield file if block_given?
      end
    end

    def file_paths
      Dir.glob( "#{root}/*" ).map do |f|
        (generated_file?(f) || ignored_file?(f) || not_current_os_specific_file?(f)) ?
          nil :
          f
      end.compact
    end

    def backup_file_paths
      Dir.glob( "#{Dotfiles.config.gen_root}/.predotfiles--*" ).
          reject { |f| f.include?( 'symlinks_backup' ) }
    end

    def symlink_backups
      return [] unless ::File.exists?( Dotfiles.config.backup_symlinks_filepath )

      ::File.read( Dotfiles.config.backup_symlinks_filepath ).
             chomp.
             split( "\n" ).
             map { |e| e.split( '->' ) }
    end

    def remove_symlinks_backup_file
      if ::File.exists?( Dotfiles.config.backup_symlinks_filepath )
        FileUtils.rm( Dotfiles.config.backup_symlinks_filepath )
        "Removed #{Dotfiles.config.backup_symlinks_filepath}"
      end
    end

    def root
      ::File.expand_path '../../..', __FILE__
    end

    def current_os
      return 'osx' if RUBY_PLATFORM =~ /darwin/
      'unix'
    end

    def ignored_files
      %w(
        .git
        .gitignore
        .rspec
        .rvmrc
        dotfiles.gemspec
        Gemfile
        Gemfile.lock
        Guardfile
        lib
        spec
        ssh
        tmp
        Rakefile
        README.md
        vim-themes
      )
    end

    def oses
      %w(
        osx
        unix
        windows
      )
    end

    def file_factory_options
      {
        :gen_root => Dotfiles.config.gen_root
      }
    end

    def oses_regex
      /#{oses.join('|')}/
    end

    def oses_without_current_regex
      /#{(oses - [current_os]).join('|')}/
    end

    def oses_gsub_regex
      /#{oses.map { |os| "-#{os}" }.join('|')}/
    end

    def method_name
      return :generate_and_symlink if file.erb?
      :symlink
    end

    def forced?
      force
    end

    def os_specific_file?( file )
      ::File.basename( file ) =~ oses_regex
    end

    def not_current_os_specific_file?( file )
      ::File.basename( file ) =~ oses_without_current_regex
    end

    def ignored_file?( file )
      ignored_files.include? ::File.basename( file )
    end

    def erb_file?( file )
      ::File.file?( file ) && ::File.extname( file ) == '.erb'
    end

    def rakefile?( file )
      ::File.expand_path( file ) == ::File.expand_path(__FILE__)
    end

    def markdown_file?( file )
      %w(.markdown .md).include? ::File.extname( file ).downcase
    end

    def generated_file?( file )
      ::File.basename( file ).include? '-generated'
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
