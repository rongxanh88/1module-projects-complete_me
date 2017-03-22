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

  def get_suggestions(root_node, prefix)
    prefix = prefix.split("").to_a
    get_suggestions_recursively(root_node, prefix)
  end

  def get_suggestions_recursively(node, prefix)
    return if prefix.length == 1 #stops recursion

    first_char = prefix[0]
    #traverse all the way down
    
    if children.has_key?(first_char)
      child_node = get_child_node(node, first_char)
      get_suggestions_recursively(child)
    end
    

  end
  
  def get_child_node(node, first_char)
    #node[:children[first_char]]
  end
end