require 'rubygems'
require 'dream_cheeky'

DreamCheeky::BigRedButton.run do
  push do
    print "alarm\n"
    `osascript -e "set Volume 5"`
    `say Ali ALERT!`
    `osascript -e "set Volume 0"`
  end
end
