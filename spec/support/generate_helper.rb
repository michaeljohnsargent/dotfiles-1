module GenerateHelper

  def create_file_at_gen_root( filename )
    FileUtils.touch ::File.join( gen_root, filename )
  end

  def create_dir_at_gen_root( dirname )
    FileUtils.mkdir_p ::File.join( gen_root, dirname )
  end

  def cleanup_gen_root
    Dir.glob("#{gen_root}/{*,.*}").
        reject { |f| ['.', '..', '.gitkeep'].include?( ::File.basename( f )) }.
        each do |f|
      FileUtils.rm_rf( f )
    end
  end

end

RSpec.configure do |config|
  config.include GenerateHelper, :generate => true
end
