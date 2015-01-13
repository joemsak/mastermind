module Mastermind
  class Player
  end

  class Game
    attr_reader :player

    def initialize
      @started = false
      @player = Player.new
    end

    def start
      @started = true
    end

    def started?
      @started
    end
  end
end
