#!/usr/bin/env ruby

require 'av_capture'

session = AVCapture::Session.new
dev     = AVCapture.devices.find(&:video?)

p dev.name
p dev.video?

session.run_with(dev) do |connection|
  sleep 1
  File.open("pic.jpg", 'wb') { |f|
    f.write connection.capture
  }
end