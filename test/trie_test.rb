require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/trie'

class TrieTest < Minitest::Test
  def test_instance_of_trie
    trie = Trie.new
    assert_instance_of Trie, trie
  end
  
end
