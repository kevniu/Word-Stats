require 'spec_helper'

describe Wordstats do
  it 'has a version number' do
    expect(Wordstats::VERSION).not_to be nil
  end

  describe 'wordstats' do
    let(:input) { 'The fat cat jumped over the house. Another fat cat wandered into the yard.' }
    let(:output) { subject.process(input) }

    it 'return the number of words in a string' do
      expect(Wordstats.word_count(input)).to eq 14
    end

    it 'return the average word length in a string rounded to the nearest integer' do
      expect(Wordstats.avg_word_length(input)).to eq 4
    end

    it 'return the most common noun in a string' do
      expect(Wordstats.most_common_noun(input)).to eq ['cat']
    end

    it 'return the most common word in a string' do
      expect(Wordstats.most_common_word(input)).to eq ['the']
    end

    it 'return the average sentence length in a string' do
      expect(Wordstats.avg_sentence_length(input)).to eq 7
    end

  end

end
