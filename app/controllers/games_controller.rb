require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    parsing = JSON.parse(open(url).read)
    if parsing['found'] == true
      return @result = "Sorry but #{@word} can't be build out of the original grid."
    elsif parsing['error'] == "word not found"
      return @result = "Sorry but #{@word} doesn't seem to exist in English"
    else
      return @result = "YOU WIN! Your word = #{@word}."
    end
  end
end
