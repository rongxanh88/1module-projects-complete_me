require 'pry'
class Node
  attr_accessor :children, :node_name, :complete_word

  def initialize(node_name="")
    @node_name = node_name
    @children = Hash.new
  end
  
  def add_words(word)
    letters = word.split("").to_a
    add_letters_recursively(letters, word)
  end
  
  def add_letters_recursively(letters, full_word)
    if letters.size == 0
      complete_word = full_word
      return
    end

    first_letter = letters.shift

    if !children.has_key?(first_letter)
      children[first_letter] = Node.new(first_letter)
    end
    
    children[first_letter].add_letters_recursively(letters, full_word)
  end

  def get_suggestions(prefix)
    prefix = prefix.split("").to_a
    get_suggestions_recursively(prefix)
  end

  def get_suggestions_recursively(prefix)
    if prefix.length == 0 #stops recursion
      return children
    end
    
    first_letter = prefix.shift
    
    if children.has_key?(first_letter)
      children[first_letter].get_suggestions_recursively(prefix)
    else
      return ["No Suggestions"]
    end
  end
end