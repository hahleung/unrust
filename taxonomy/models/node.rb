require 'securerandom'

module Model
  class Node
    attr_reader(:name, :tag, :parent_id, :children_id, :id)

    def initialize(name, tag, parent_id, children_id, id)
      @name = name
      @tag = tag
      @parent_id = parent_id
      @children_id = children_id
      @id = id.nil? ? SecureRandom.hex(10) : id
    end

    def self.initialize_with_name_tag(name, tag)
      Node.new(name, tag, nil, [], nil)
    end

    def self.initialize_with_name(name)
      Node.new(name, [], nil, [], nil)
    end

    def parent(tree)
      tree.get_node_by_id(@parent_id)
    end

    def children(tree)
      @children_id.map do |id|
        tree.get_node_by_id(id)
      end
    end

    def add_child(child_id)
      new_children_id = @children_id + [child_id]
      Node.new(@name, @tag, @parent_id, new_children_id, @id)
    end

    def add_parent(parent_id)
      Node.new(@name, @tag, parent_id, @children_id, @id)
    end

  end
end
