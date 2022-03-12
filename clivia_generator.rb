require_relative "presenter"
require_relative "requester"
require "httparty"
require "json"

class CliviaGenerator
  include Requester
  include Presenter

  def initialize
    @user = nil
  end

  def start
    print_welcome
    action = ""
    
    until action == "exit"
      action = get_menu(["random", "scores", "exit"])
      case action
      when "random" then random
      when "scores" then puts "scores"
      when "exit" then puts "exit"
      end
    end
  end

  def random_trivia
    ask_questions
    start
  end

  def ask_questions
    # ask each question
    # if response is correct, put a correct message and increase score
    # if response is incorrect, put an incorrect message, and which was the correct answer
    # once the questions end, show user's score and promp to save it
  end

  def save(data)
    # write to file the scores data
  end

  def parse_scores
    # get the scores data from file
  end

  def load_questions
    # ask the api for a random set of questions
    # then parse the questions
  end

  def parse_questions
    # questions came with an unexpected structure, clean them to make it usable for our purposes
  end

  def print_scores
    # print the scores sorted from top to bottom
  end
end

trivia = CliviaGenerator.new
trivia.random_trivia
