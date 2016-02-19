require 'rubygems'
require 'dream_cheeky'

DreamCheeky::BigRedButton.run do
  push do
    print "alarm\n"
    `say -v Fiona DPR ALARM! Call Jee Pee Jay!`
  end
  open do
    print "open\n"
    `say -v Fiona Do not press it!`
  end
  close do
    print "phew\n"
    `say -v Fiona phew!`
  end
end
