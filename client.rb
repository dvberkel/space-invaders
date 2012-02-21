#! /usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'rubygame'

class Alien
  def initialize(dx=1, dy=1)
    @surface = Rubygame::Surface.load("resource/image/alien.png")
    @x = 10
    @y = 10
    @dx = dx
    @dy = dy
  end
  
  def blit(screen)
    @surface.blit(screen,[@x, @y])
  end

  def up()
    @y -= @dx
  end

  def down()
    @y += @dx
  end

  def left()
    @x -= @dx
  end

  def right()
    @x += @dx
  end
end


class GuiView
  include Rubygame

  def initialize()
    @screen = Screen.new [775, 572]
    @background = Surface.load("resource/image/background.png")
    @events = EventQueue.new
    @alien = Alien.new(10, 10)
  end

  def eventLoop()
    loop do
      @events.each do |event|
        case event
        when QuitEvent
          return
        when KeyDownEvent
          case event.key 
          when K_UP
            @alien.up
          when K_DOWN 
              @alien.down
          when K_LEFT 
              @alien.left
          when K_RIGHT 
              @alien.right
          end
        end
      end
      draw
    end
  end

  def draw()
    @background.blit(@screen, [0,0])
    @alien.blit(@screen)
    @screen.update
  end
end

Rubygame.init
GuiView.new.eventLoop
Rubygame.quit
