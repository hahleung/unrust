require 'minitest/autorun'
require_relative '../../models/node.rb'

class NodeTest < Minitest::Test
  NODE1 = Model::Node.initialize_with_name('restaurants')
  NODE2 = Model::Node.initialize_with_name_tag('starbuck', 'bad')
  NODE3 = Model::Node.initialize_with_name('theaters')

  def test_add_child
    new_node = NODE1.add_child(NODE2.id)
    child_id = new_node.children_id.first

    assert_equal(child_id, NODE2.id)
  end

  def test_add_parent
    new_node = NODE3.add_parent(NODE1.id)
    id_of_parent = new_node.parent_id

    assert_equal(id_of_parent, NODE1.id)
  end
end
