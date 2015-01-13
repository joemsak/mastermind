require 'mastermind/player'

module Mastermind
  class Codemaster
    def create_code
      'RGBY'
    end
  end

  class Game
    attr_reader :player, :codemaster, :code, :guesses, :feedback

    def initialize
      @started = false
      @player = Player.new(self)
      @codemaster = Codemaster.new
      @guesses = []
      @feedback = []
    end

    def start
      @started = true
      @code = codemaster.create_code
    end

    def started?
      @started
    end

    def make_guess(guessed_code)
      @guesses << guessed_code
      feedback = ''

      code.split('').each_with_index do |peg, index|
        if guessed_code.include?(peg) && guessed_code[index] == peg
          feedback += '*'
        elsif guessed_code.include?(peg)
          feedback += 'x'
        else
          feedback += '-'
        end
      end

      @feedback << feedback
    end
  end
end
