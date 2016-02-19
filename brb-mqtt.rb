require 'rubygems'
require 'dream_cheeky'
require 'mqtt'

client = MQTT::Client.connect('mqtt://localhost')

DreamCheeky::BigRedButton.run do
  push do
    print "pressed\n"
    client.publish('button','pressed', false)
  end
  open do
    print "opened\n"
    client.publish('button','opened', false)
  end
  close do
    print "closed\n"
    client.publish('button','closed', false)
  end
end
