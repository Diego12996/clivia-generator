module Presenter
  def print_welcome
    puts "###################################"
    puts "#   Welcome to Clivia Generator   #"
    puts "###################################"
  end

  def print_score(score)
    # print the score message
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
