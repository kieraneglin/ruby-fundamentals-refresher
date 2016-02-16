require 'restaurant'
class Guide

  def initialize(path=nil)
    Restaurant.filepath = path
    if Restaurant.file_usable?
      puts 'Found file'
    elsif Restaurant.create_file
      puts 'Created File'
    else
      puts "Exiting\n\n"
      exit!
    end
  end

  def launch!
    introduction

    print "> "
    user_response = gets.chomp

    conclusion
  end

  def introduction
    puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
    puts "This is an interactive guide to help you find food!"
    puts "(and a good excuse for me to work on my fundamentals)"
  end

  def conclusion
    puts "\n<<< See Ya! >>>\n\n\n"
  end

end
