Pry.config.editor = 'vim'

# History (Use one history file)
#Pry.config.history.file = "~/.irb_history"

# https://github.com/kyrylo/pry-theme
# $ gem install pry-theme
# https://github.com/kyrylo/pry-theme-collection
# $ cd ~/.pry/themes
# $ wget https://raw2.github.com/kyrylo/pry-theme-collection/master/ocean/ocean.prytheme.rb
# $ pry
# $ pry-theme install ocean
#Pry.config.theme = 'railscasts'

Pry.commands.alias_command 'ep', 'exit-program'

if defined?( PryDebugger )
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# ==============================
#   Customized hotkeys for Pry
# ==============================

# Ever get lost in pryland? try w!
Pry.config.commands.alias_command 'w', 'whereami'

# Clear Screen
Pry.config.commands.alias_command '.clr', '.clear'

# Custom prompt
#prompt = "ruby-#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
#Pry.config.prompt = [
  #proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} > " },
  #proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} * " }
#]

# Exception
#Pry.config.exception_handler = proc do |output, exception, _|
  #puts ___.colorize "#{exception.class}: #{exception.message}", 31
  #puts ___.colorize "from #{exception.backtrace.first}", 31
#end

# Default Command Set, add custom methods here:
custom_command_set = Pry::CommandSet.new do

  command 'copy', 'Copy to clipboard' do |str|
    str = "#{_pry_.input_array[-1]}#=> #{_pry_.last_result}\n" unless str
    IO.popen('pbcopy', 'r+') { |io| io.puts str }
    output.puts "-- Copy to clipboard --\n#{str}"
  end

end

# Use Array.toy to get an array to play with
class Array
  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n) { |i| i+1 }
  end
end

# Use Hash.toy to get an hash to play with
class Hash
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n){ |c| (96+(c+1)).chr })]
  end
end

Pry.config.commands.import( custom_command_set )

if Dir.pwd.split( '/' ).last == 'ncite_pass_control_server'
  Time.zone = configatron.installation.time_zone
end
