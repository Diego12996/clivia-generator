require "httparty"
require "json"

module Requester
  include HTTParty

  base_uri("https://opentdb.com/api.php?")

  def self.ask_question
    response = get('amount=10')
    a = JSON.parse(response.body, symbolize_names: true)
    score = 0
    for i in 0..9 do
      puts "Category: #{a[:results][i][:category]} | Difficulty: #{a[:results][i][:difficulty]}"
      puts "Question: #{a[:results][i][:question]}"
      score += gets_option(a[:results][i][:correct_answer], a[:results][i][:incorrect_answers])
    end
    will_save(score)
  end

  def self.will_save(score)
    puts "Well done! Your score is #{score}"
    puts "--------------------------------------------------"
    puts "Do you want to save your score? (y/n)"
    election = gets.chomp
    election = election.downcase
    name = ""
    if election == "y"
      puts "Type the name to assign to the score"
      print "> "
      name = gets.chomp
      if name.empty?
        name = "Anonimous"
      end
    else
      print ""
    end
    score({name: name, score: score})
  end

  def self.gets_option(correct_answer, incorrect_answers)
    election = ""
    answers = incorrect_answers
    answers.push(correct_answer)
    answers = answers.shuffle
    answers.each_with_index do |answer, index|
      puts "#{index + 1}. #{answer}"
    end
    print "> "
    election = gets.chomp.to_i
    if answers[election - 1] == correct_answer
      score = 10
    else
      puts "#{answers[election - 1]}... Incorrect!"
      puts "The correct answer was #{correct_answer}"
      score = 0
    end
    puts ""
    score
  end

  def self.score(player_score)
    filescore = read_file
    filescore.push(player_score)
    File.open("table.json", "w") do |file|
      file.write(JSON.pretty_generate(filescore))
    end
  end

  def self.read_file
    File.open("table.json", "a+")
    JSON.parse(File.read("table.json"))

    rescue JSON::ParserError 
      []
  end

end

a = Requester.ask_question