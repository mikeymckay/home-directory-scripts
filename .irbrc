# Copy this to your home directory and rename it to .irbrc
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

require 'irb/completion'
# Had to download http://pastie.org/513500 to make history work
require 'irb/ext/save-history'

ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:HISTORY_NO_DUPS] = true


require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize

# Lets you do stuff like ConceptSet.find(:all).names 
class Array
  def names
    self.map{|element|element.name}
  end
end


class Object
# Return a list of methods defined locally for a particular object.  Useful
# for seeing what it does whilst losing all the guff that's implemented
# by its parents (eg Object).
  def local_methods(obj = self)
    (obj.methods - obj.superclass.instance_methods).sort
  end
end

