require 'rubygems'
require 'dream_cheeky'

DreamCheeky::BigRedButton.run do
  push do
    print "alarm\n"
    `say DPR ALARM!`
  end
  open do
    print "open\n"
    `say Do not press it!`
  end
  close do
    print "phew\n"
    `say phew!`
  end
end
