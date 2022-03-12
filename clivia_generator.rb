require_relative "presenter"
require_relative "requester"
require "httparty"
require "json"
require "htmlentities"
class CliviaGenerator
  include Requester
  include Presenter
  def start
    print_welcome
    action = ""

    until action == "exit"
      action = get_menu(["random", "scores", "exit"])
      case action
      when "random" then random_trivia
      when "scores" then puts print_scores
      when "exit" then puts "Thanks for using CLIvia generator"
      end
    end
  end

  def random_trivia
    Requester.ask_question
    print_welcome
  end

  def print_scores
    table
    print_welcome
  end
end

trivia = CliviaGenerator.new
trivia.start
