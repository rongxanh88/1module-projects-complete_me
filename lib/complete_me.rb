require_relative 'node'

class CompleteMe

  def initialize(dictionary=[])
    @root_node = Node.new
    @word_count = 0
    dictionary.each {|word| insert(word)}
  end
  
  def insert(word)
    @root_node.add_words(word)
    @word_count += 1
  end
  
  def populate(words)
    words = words.split("\n").to_a
    words.each {|word| insert(word)}
  end

  def count
    @word_count
  end
  
  def select
    #select picks a suggestion based on previous selections
  end
  
  def suggest(prefix)
    suggestions = @root_node.get_suggestions(@root_node, prefix)
  end
  
  
end