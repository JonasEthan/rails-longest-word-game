require 'open-uri'
require 'json'
class GamesController < ApplicationController

  def index
    alphabet = [*'a'..'z']
    @letters = []

    10.times { @letters << alphabet[rand(0...alphabet.size)] }
    # raise
    @letters
  end

  def score
    @letters = params[:letters].split
    @word = params[:word].downcase
    @included = included?(@letters, @word)
    @is_word = is_word?(@word)
    @score = count_score(@word) if @is_word && @included
    @score = 0 unless @is_word
  end

  private

  def included?(letters, word)
    word.chars.all? do |char|
      if letters.include?(char)
        index = letters.index(char)
        letters.delete_at(index)
      end
    end
  end

  def is_word?(word)
    uri = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    check = JSON.parse(uri.read)
    check['found']
  end

  def count_score(word)
    number_of_letters = word.size
    number_of_letters
  end
end
