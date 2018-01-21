require_relative 'node.rb'

module Model
  class Tree
    attr_reader(:first_root, :nodes)

    def initialize(first_root, nodes)
      @first_root = first_root
      @nodes = nodes
    end

    def self.initialize_with_first_root(first_root)
      Tree.new(first_root, [first_root])
    end

    def add_child_to_root(child, root)
      root_in_tree = self.retrieve_node(root)

      new_root = root_in_tree.add_child(child.id)
      new_child = child.add_parent(root.id)

      self.update(new_root, new_child)
    end

    def add_sibling_to_node(sibling, node)
      node_in_tree = self.retrieve_node(node)
      parent = get_node_by_id(node_in_tree.parent_id)

      new_parent = parent.add_child(sibling.id)
      new_sibling = sibling.add_parent(new_parent.id)

      self.update(new_parent, new_sibling)
    end

    def update(node, another_node)
      new_nodes = @nodes.map do |n|
        node.id == n.id ? node : n
      end + [another_node]

      Tree.new(@first_root, new_nodes)
    end

    def get_node_by_id(id)
      @nodes.select do |n|
        n.id == id
      end.first
    end

    def retrieve_node(node)
      retrieved_node = @nodes.select do |n|
        n.id == node.id
      end
      raise 'No node found' if retrieved_node.empty?
      retrieved_node.first
    end

    def retrieve_by_tag(tag)
      retrieved_node = @nodes.select do |n|
        n.tag == tag
      end
      raise 'No node found' if retrieved_node.empty?
      retrieved_node
    end
  end
end
