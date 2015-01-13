module Mastermind
  class Player
  end

  class Codemaster
    def create_code
      'RGBY'
    end
  end

  class Game
    attr_reader :player, :codemaster, :code

    def initialize
      @started = false
      @player = Player.new
      @codemaster = Codemaster.new
    end

    def start
      @started = true
      @code = codemaster.create_code
    end

    def started?
      @started
    end
  end
end
