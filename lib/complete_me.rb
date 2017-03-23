require_relative 'node'
require 'pry'

class CompleteMe
  attr_reader :root_node

  def initialize(dictionary=[])
    @root_node = Node.new
    dictionary.each {|word| insert(word)}
  end
  
  def insert(word)
    root_node.add_word(word)
  end
  
  def populate(words)
    words = words.split("\n").to_a
    words.each {|word| insert(word)}
  end

  def count
    root_node.count_words
  end
  
  def select(prefix, word)
    root_node.add_weight_to_suggestion(prefix, word)
  end
  
  def suggest(prefix)
    suggestions = root_node.get_suggestions(prefix)
  end
  binding.pry
end