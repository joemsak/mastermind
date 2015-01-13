module Mastermind
  class Game
    attr_reader :code, :guesses, :feedback

    def self.colors
      %w{R G Y B W}
    end

    def self.generate_code
      colors.sample(4)
    end

    def initialize
      @code = self.class.generate_code
      @guesses = []
      @feedback = []
      @over = false
    end

    def make_guess(guess)
      feedback = construct_feedback(guess)
      @over = feedback == '****'
      @guesses << guess
      @feedback << feedback
    end

    def over?
      @over
    end

    private
    def construct_feedback(guess)
      feedback = ''
      guess.split('').each_with_index do |peg, index|
        feedback += indicator(peg, index)
      end
      feedback
    end

    def indicator(peg, index)
      if code[index] == peg
        '*'
      elsif code.include?(peg)
        'x'
      else
        '-'
      end
    end
  end
end
