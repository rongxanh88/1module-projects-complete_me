require 'node'

class Trie

  def initialize(dictionary=[])
    @root_node = Node.new
    dictionary.each do {|word| @root_node.add_letters(word)}
  end
  
  def add_word(word)
    @root_node.add_letters(word)
  end
  
  
end
