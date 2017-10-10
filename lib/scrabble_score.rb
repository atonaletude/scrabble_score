require 'pry'
class Scrabble
  SCRABBLE_SCORES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }.freeze

  def initialize(scrabble_string)
    @string = scrabble_string
  end

  def score
    return 0 if invalid?
    score = []
    SCRABBLE_SCORES.each do |key, value|
      # binding.pry
      @string.chars.each do |letter|
        score << value if key.include?(letter.upcase)
      end
    end
    score.reduce(:+)
  end

  def invalid?
    @string.nil? || @string == '' || @string.match(/\s/)
  end

  def self.score(word)
    temp_scrabble_object = Scrabble.new(word)
    temp_scrabble_object.score
  end

end
