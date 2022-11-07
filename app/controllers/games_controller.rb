require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample(1) }
    @letters
  end

  def score
    letters = params[:letters]
    word = params[:word]
    attempt = word.upcase
    attempt_json = create_json(attempt)
    @result = { score: 0, result: 'win' }
    # if attempt is false or letters are not in grid
    @result[:result] = 'not found' unless attempt_json['found']
    @result[:result] = 'fail' unless check_grid_word?(attempt, letters)
    # if attempt is right
    # if check_grid_word?(attempt, params[:letters]) && attempt_json['found']
    #   result[:score] = (end_time - start_time) < 10 ? attempt_json['length'].to_f + 1 : attempt_json['length'].to_f
    # end

    # result[:time] = end_time - start_timse
    # result
  end

  def create_json(word_to_check)
    url = "https://wagon-dictionary.herokuapp.com/#{word_to_check}"
    url_serialized = URI.open(url).read
    JSON.parse(url_serialized)
  end

  def check_grid_word?(word_to_check, grid)
    word_to_check.chars.all? do |letter|
      grid.count(letter) >= word_to_check.chars.count(letter)
    end
  end
end
