require "wordstats/version"
require "engtagger"

class Wordstats
  # Your code goes here...
  def initialize
    @tagger = EngTagger.new
  end

  def process(str)
    word_count(str)
    avg_word_length(str)
    most_common_noun(str)
    most_common_word(str)
    avg_sentence_length(str)
  end

  def word_count(str)
    word_arr = str.split(' ')
    word_arr.length
  end

  def avg_word_length(str)
    word_arr = str.split(' ')
    word_length_arr = []
    word_arr.each do |word|
      word_length_arr << word.length
    end
    word_length_arr.reduce(:+) / word_length_arr.length
  end

  def most_common_noun(str)
    str = str.downcase
    tagged_str = @tagger.add_tags(str)
    noun_list = @tagger.get_nouns(tagged_str)
    highest_count = 0

    noun_list.each do |k, v|
      if v > highest_count
        highest_count = v
      end
    end

    most_common = noun_list.select {|k, v| v == highest_count}
    most_common.keys
  end

  def most_common_word(str)
    str = str.downcase
    word_list = str.split(' ')

    word_hash = Hash.new(0)
    word_list.each { |key| word_hash[key] += 1 }

    highest_count = 0

    word_hash.each do |k, v|
      if v > highest_count
        highest_count = v
      end
    end

    most_common = word_hash.select {|k, v| v == highest_count}
    most_common.keys
  end

  def avg_sentence_length(str)
    sentence_arr = str.scan(/[^\.!?]+[\.!?]/).map(&:strip)
    sentence_length_arr = []

    sentence_arr.each do |sentence|
      word_arr = sentence.split(' ')
      sentence_length_arr << word_arr.length
    end
    sum = sentence_length_arr.reduce(:+)
    sum / sentence_length_arr.length
  end

end
