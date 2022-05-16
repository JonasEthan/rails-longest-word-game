class GamesController < ApplicationController

  def index
    alphabet = [*'a'..'z']
    @letters = []

    10.times { @letters << alphabet[rand(0...alphabet.size)] }
    # raise
  end
end
