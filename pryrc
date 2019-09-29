begin
  require 'awesome_print'
  rescue LoadError
else
  AwesomePrint.pry!
end

begin
  require "hirb"
  require "hirb-unicode"
  extend Hirb::Console
rescue LoadError => e
end
