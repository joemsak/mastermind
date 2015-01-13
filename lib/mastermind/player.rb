module Mastermind
  class Player
    def initialize(game)
      @game = game
    end

    def guess(guessed_code)
      @game.make_guess(guessed_code)
    end
  end
end
