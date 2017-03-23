require 'pry'
class Node
  attr_accessor :children, :node_name, :complete_word

  @@suggestions = []
  @@word_count = 0
  @@weight = Hash.new

  def initialize(node_name="")
    @node_name = node_name
    @children = Hash.new
  end
  
  def add_word(word)
    letters = word.split("").to_a
    add_letters_recursively(letters, word)
  end
  
  def get_suggestions(prefix)
    @@suggestions.clear
    prefix = prefix.split("").to_a
    get_suggestions_recursively(prefix)
    sort_suggestions
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
      find_complete_words_recursively(children)
    elsif prefix.size == 1
      if children[prefix[0]].complete_word != nil
        @@suggestions << children[prefix[0]].complete_word
      end
    end

    first_letter = prefix.shift
    
    if children.has_key?(first_letter)
      children[first_letter].get_suggestions_recursively(prefix)
    else
      return ["No Suggestions"]
    end
  end

  def key_not_present?(letter)
    !children.has_key?(letter)
  end

  def find_complete_words_recursively(children={})
    children.each do |letter, node|
      if node.complete_word != nil
        @@suggestions << node.complete_word
      end
      
      grandchildren = node.children
      find_complete_words_recursively(grandchildren)
    end
  end

  def count_words
    @@count_words = 0
    count_recursively(children)
    return @@count_words
  end
  
  def count_recursively(children={})
    children.each do |letter, node|
      if node.complete_word != nil
        @@count_words += 1
      end
      
      grandchildren = node.children
      count_recursively(grandchildren)
    end
  end

  def add_weight_to_suggestion(prefix, word)
    prefix = prefix.split("").to_a
    select_recursively(prefix, word)
  end
  
  def select_recursively(prefix=[], word)
    if prefix.empty?
      mark_selected_word(children, word)
      return
    end

    first_letter = prefix.shift
    
    if children.has_key?(first_letter)
      children[first_letter].select_recursively(prefix, word)
    else
      return ["Prefix entered incorrectly."]
    end
  end

  def mark_selected_word(children={}, word)
    #puts "#{children}"
    children.each do |letter, node|
      if node.complete_word == word
        if @@weight[word] == 1
          @@weight[word] += 1
        else
          @@weight[word] = 1
        end
        return
      end
      
      grandchildren = node.children
      mark_selected_word(grandchildren, word)
    end
  end

  def sort_suggestions

  end
  
  
end