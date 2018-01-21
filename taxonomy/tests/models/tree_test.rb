require 'minitest/autorun'
require_relative '../../models/tree.rb'
require_relative '../../models/node.rb'

class TreeTest < Minitest::Test
  NODE1 = Model::Node.initialize_with_name('restaurants')
  NODE2 = Model::Node.initialize_with_name_tag('starbuck', 'hipster')
  NODE3 = Model::Node.initialize_with_name_tag('mcdo', 'healthy')
  NODE4 = Model::Node.initialize_with_name_tag('pret', 'hipster')

  tree = Model::Tree.initialize_with_first_root(NODE1)

  TREE = tree.add_child_to_root(
    NODE2,
    NODE1
  ).add_child_to_root(
    NODE4,
    NODE1
  ).add_sibling_to_node(
    NODE3,
    NODE2
  )

  def test_add_children
    new_root = TREE.retrieve_node(NODE1)
    child1 = TREE.retrieve_node(NODE2)
    child2 = TREE.retrieve_node(NODE3)
    child3 = TREE.retrieve_node(NODE4)

    assert_equal(3, new_root.children_id.size)
    assert_equal(
      ['starbuck', 'mcdo', 'pret'].sort,
      new_root.children(TREE).map(&:name).sort
    )
    assert_equal('restaurants', child1.parent(TREE).name)
    assert_equal('restaurants', child2.parent(TREE).name)
    assert_equal('restaurants', child3.parent(TREE).name)
  end
end
