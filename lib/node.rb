require 'pry'
class Node
  attr_accessor :children, :node_name

  def initialize(node_name="")
    @node_name = node_name
    @children = Hash.new
  end
  
  def add_words(word)
    letters = word.split("").to_a
    add_letters_recursively(letters, word)
  end
  
  def add_letters_recursively(letters, full_word)
    @full_word = full_word
    return if letters.size == 0

    first_letter = letters[0]
    !children.has_key?(first_letter) ? children[first_letter] = Node.new(first_letter) : #do nothing
    children[first_letter].add_letters_recursively(letters[1...letters.size], full_word)
  end
end
