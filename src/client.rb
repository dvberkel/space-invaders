#! /usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'rubygame'

class GuiView
  include Rubygame

  def initialize()
    @screen = Screen.new [640, 480]
    @events = EventQueue.new
  end

  def eventLoop()
    loop do
      @events.each do |event|
        case event
        when QuitEvent
          return
        end
      end
    end
  end
end

Rubygame.init
GuiView.new.eventLoop
Rubygame.quit
