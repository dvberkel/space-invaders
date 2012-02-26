#! /usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'rubygame'
require 'aliens'
require 'gun'

class Piece
  def initialize(resource, x=0, y=0)
    @surface = Rubygame::Surface.load(resource)
    @x = x
    @y = y
    @dx = 10
    @dy = 10
  end
  
  def blit(screen)
    @surface.blit(screen,[@x, @y])
  end

  def update(x, y)
    @x = x
    @y = y
  end

  def up()
    self.update(@x, @y - @dy)
  end

  def down()
    self.update(@x, @y + @dy)
  end

  def left()
    self.update(@x - @dx, @y)
  end

  def right()
    self.update(@x + @dy, @y)
  end
end

class AlienPiece < Piece
  def initialize(x, y)
    super("resource/image/alien-0.png", x, y)
  end
end

class GunPiece < Piece
  def initialize(x, y)
    super("resource/image/gun.png", x, y)
  end
end

class MoveEvent
end

class GuiView
  include Rubygame

  def initialize()
    @screen = Screen.new [775, 572]
    @background = Surface.load("resource/image/background.png")
    @events = EventQueue.new
    @alien = AlienPiece.new(10, 10)
    @gun = GunPiece.new(375,500)
    @pieces = {}
  end

  def addPiece(id, piece)
    @pieces[id] = piece
  end

  def addAlien(alien)
    piece = AlienPiece.new(alien.location.x, alien.location.y)
    self.addPiece(alien.id, piece)
  end

  def addGun(gun)
    piece = GunPiece.new(gun.location.x, gun.location.y)
    self.addPiece(gun.id, piece)
  end

  def eventLoop()
    self.addAlien(Alien.new())
    self.addGun(Gun.new({:location => Vector.new(50,50)}))
    loop do
      event = MoveEvent.new
      @events.post(event)
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
        when MoveEvent
          @alien.right
        end
      end
      draw
    end
  end

  def draw()
    @background.blit(@screen, [0,0])
    @alien.blit(@screen)
    @pieces.each_value {|piece| piece.blit(@screen)}
    @gun.blit(@screen)
    @screen.update
  end
end

Rubygame.init
GuiView.new.eventLoop
Rubygame.quit
