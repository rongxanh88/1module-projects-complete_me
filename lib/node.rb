require 'pry'
class Node
  attr_accessor :children, :node_name, :complete_word

  @@suggestions = []

  def initialize(node_name="")
    @node_name = node_name
    @children = Hash.new
  end
  
  def add_word(word)
    letters = word.split("").to_a
    add_letters_recursively(letters, word)
  end
  
  def get_suggestions(prefix)
    prefix = prefix.split("").to_a
    get_suggestions_recursively(prefix)
    return @@suggestions
  end

  def add_letters_recursively(letters=[], full_word)
    if letters.empty?
      @complete_word = full_word
      return
    end

    first_letter = letters.shift

    if key_not_present?(first_letter)
      children[first_letter] = Node.new(first_letter)
    end
    
    children[first_letter].add_letters_recursively(letters, full_word)
  end

  def get_suggestions_recursively(prefix=[])
    if prefix.empty?
      find_all_full_words(children)
    end
    
    first_letter = prefix.shift
    
    if children.has_key?(first_letter)
      children[first_letter].get_suggestions_recursively(prefix)
    else
      return ["No Suggestions"]
    end
  end

  def find_all_full_words(children={})
    @@suggestions.clear
    find_recursively(children)
  end

  def key_not_present?(letter)
    !children.has_key?(letter)
  end

  def find_recursively(children={})
    children.each do |letter, node|
      if node.complete_word != nil
        @@suggestions << node.complete_word
      end
      
      grandchildren = node.children
      find_recursively(grandchildren)
    end
  end

end