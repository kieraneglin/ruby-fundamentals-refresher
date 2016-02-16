require 'restaurant'
class Guide

  class Config
    @@actions = ['list', 'find', 'add', 'quit']
    def self.actions
      @@actions
    end
  end

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

    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
    end
    conclusion
  end

  def get_action
    action = nil
    until Guide::Config.actions.include?(action)
      puts "Actions: " + Guide::Config.actions.join(', ') if action
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action
  end

  def do_action(action)
    case action
    when 'list'
      puts 'Listing...'
    when 'find'
      puts 'Finding'
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts 'I dont understand that'
    end
  end

  def add
    puts "\nAdd a restaurant".upcase
    rest = Restaurant.new

    print "Restaurant name: "
    rest.name = gets.chomp.strip
    print "Cuisine type: "
    rest.cuisine = gets.chomp.strip
    print "Average price: "
    rest.price = gets.chomp.strip

    if rest.save
      puts 'Saved'
    else
      puts 'error'
    end
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
