require_relative 'node'
require 'pry'

class CompleteMe
  attr_reader :root_node

  def initialize(dictionary=[])
    @root_node = Node.new
    @word_count = 0
    dictionary.each {|word| insert(word)}
  end
  
  def insert(word)
    root_node.add_word(word)
    @word_count += 1
  end
  
  def populate(words)
    words = words.split("\n").to_a
    words.each {|word| insert(word)}
  end

  def count
    @word_count
    #fix this method, need to do a DFS
  end
  
  def select
    #select picks a suggestion based on previous selections
  end
  
  def suggest(prefix)
    suggestions = root_node.get_suggestions(prefix)
  end
  binding.pry
end