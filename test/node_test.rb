require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/node'

class NodeTest < Minitest::Test
  attr_reader :node
  def setup
    @node = Node.new
  end
  
  def test_node_instance
    assert node.instance_of?(Node)
  end
  
  def test_has_children
    childs = {}
    assert_equal childs, node.children
  end

  def test_node_object_id
    assert_equal @node.object_id, node.object_id
  end
  
  def test_add_word
    word = "hello"
    node.add_words(word)
  end
  
end

