#! /usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'rubygame'
require 'aliens'
require 'gun'
require 'bullet'
require 'game'

class Piece
  def initialize(resource, x=0, y=0)
    @surface = Rubygame::Surface.load(resource)
    update(x,y)
  end
  
  def blit(screen)
    @surface.blit(screen,[@x - @surface.w/2, @y])
  end

  def update(x, y)
    x, y = transform(x,y)
    @x = x
    @y = y
  end

  def transform(x, y)
    return x + 387, -y + 500
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

class BulletPiece < Piece
  def initialize(x, y)
    super("resource/image/bullet.png", x, y)
  end
end

class NullPiece < Piece
  def update(x,y)
    # do nothing
  end
end

class Keys
  include Rubygame

  def initialize()
    @keys_down = []
  end
  
  def tick(game)
    @keys_down.each do |key|
      case key
      when K_LEFT
        game.signal(LeftSignaled.new)
      when K_RIGHT
        game.signal(RightSignaled.new)
      end
    end
  end
  
  def down(key)
    @keys_down << key unless @keys_down.include?(key)
  end
  
  def up(key)
    @keys_down.delete(key)
  end
end

class GuiView
  include Rubygame
  
  def initialize()
    @screen = Screen.new [775, 572]
    @background = Surface.load("resource/image/background.png")
    @events = EventQueue.new
    @pieces = {}
    @game = Game.new()
    @game.addObserver(self)
    @keys = Keys.new
  end

  def addPiece(id, piece)
    @pieces[id] = piece
  end

  def removePiece(id)
    @pieces.delete id
  end
  
  def addAlien(alien)
    piece = AlienPiece.new(alien.location.x, alien.location.y)
    self.addPiece(alien.id, piece)
  end

  def addGun(gun)
    piece = GunPiece.new(gun.location.x, gun.location.y)
    self.addPiece(gun.id, piece)
  end
  
  def addBullet(bullet)
    piece = BulletPiece.new(bullet.location.x, bullet.location.y)
    self.addPiece(bullet.id, piece)
  end

  def move(event)
    piece = @pieces[event.id] || NullPiece
    piece.update(event.location.x, event.location.y)
  end

  def notify(event)
    @events.post(event)
  end

  def eventLoop()
    @game.start()
    loop do
      @game.tick
      @keys.tick(@game)
      @events.each do |event|
        case event
        when QuitEvent
          return
        when Finished
          removePiece(event.id)
        when Moved
          move(event)
        when AlienAdded
          addAlien(event.alien)
        when GunAdded
          addGun(event.gun)
        when GunFired
          addBullet(event.bullet)
        when KeyDownEvent
          if event.key == K_SPACE
            @game.signal(FireSignaled.new) if event.key == K_SPACE
          else
            @keys.down(event.key)
          end
        when KeyUpEvent
          @keys.up(event.key)
        end
      end
      draw
    end
  end

  def draw()
    @background.blit(@screen, [0,0])
    @pieces.each_value {|piece| piece.blit(@screen)}
    @screen.update
  end
end

Rubygame.init
GuiView.new.eventLoop
Rubygame.quit
