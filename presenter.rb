require "json"
require "terminal-table"
module Presenter
  def print_welcome
    puts "###################################"
    puts "#   Welcome to Clivia Generator   #"
    puts "###################################"
  end

  def table
    file = File.read("table.json")
    scores = JSON.parse(file)
    rows = []
    scores.each do |value|
      rows << [value["name"], value["score"]]
    end
    table = Terminal::Table.new :title => "Top Scores", :headings =>["Name", "Score"], :rows => rows
    puts table
  end

  def get_menu(options)
    action = ""

    loop do
      puts options.join(" | ")
      print "> "
      action = gets.chomp
      break if options.include?(action)
      
        puts "Invalid option"
    end
    action
  end
end
