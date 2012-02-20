#! /usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'rubygame'

class Alien
  def initialize()
    @surface = Rubygame::Surface.load("resource/image/alien.png")
    @x = 10
    @y = 10
  end
  
  def blit(screen)
    @surface.blit(screen,[@x, @y])
  end
end


class GuiView
  include Rubygame

  def initialize()
    @screen = Screen.new [640, 480]
    @events = EventQueue.new
    @aliens = [Alien.new]
  end

  def eventLoop()
    loop do
      @events.each do |event|
        case event
        when QuitEvent
          return
        end
      end
      draw
    end
  end

  def draw()
    @screen.fill [0, 0, 0]
    @aliens.each do |alien|
      alien.blit(@screen)
    end
    @screen.update
  end
end

Rubygame.init
GuiView.new.eventLoop
Rubygame.quit
