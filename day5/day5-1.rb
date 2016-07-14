class CheckNiceWords

  FILE = "day5/day5.txt"

  THREE_VOWELS = /[aeiou].*?[aeiou].*?[aeiou]/
  REPEATED_CHARS = /(.)\1+/
  NOT_AB = /^((?!ab).)*$/
  NOT_CD = /^((?!cd).)*$/
  NOT_PQ = /^((?!pq).)*$/
  NOT_XY = /^((?!xy).)*$/

  attr_reader :nice_words

  def initialize()
    @words = get_raw_data()
  end

  def get_nice_words
    count_nice_words
    nice_words
  end

  private

  attr_reader :words

  def get_raw_data()
    data = File.read(FILE)
    data.split("\n")
  end

  def count_nice_words()
    @nice_words = 0
    words.each do |word|
      @nice_words += 1 if word.nice?
    end
    @nice_words
  end

end

class String
  def nice?
    three_vowels = self =~ CheckNiceWords::THREE_VOWELS
    repeated_chars = self=~ CheckNiceWords::REPEATED_CHARS
    not_ab = self =~ CheckNiceWords::NOT_AB
    not_cd = self =~ CheckNiceWords::NOT_CD
    not_pq = self =~ CheckNiceWords::NOT_PQ
    not_xy = self =~ CheckNiceWords::NOT_XY

    no_bad_strings = not_ab && not_cd && not_pq && not_xy
    !!(three_vowels && repeated_chars &&(no_bad_strings))
  end
end
