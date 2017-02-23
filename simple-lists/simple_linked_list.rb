require 'pry-byebug'

class Node
  attr_accessor :next, :data
  def initialize(data, next_node)
    @data = data
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head
  def initialize(data)
    @head = Node.new(data, nil)
  end

  def index_at(i)
    current = @head
    (i).times do
      current = current.next
    end
    current ? current.data : nil
  end

  def insert_at_index(index, data)
    current = @head
    previous = @head
    (index).times do |i|
      previous = current
      current.next = Node.new(nil, nil) if (!current.next && i < index-1)
      current = current.next
    end
    previous.next = Node.new(data, current)
  end

  def unshift(data)
    @head = Node.new(data, @head)
  end

  def push(data)
    current = @head
    while current.next
      current = current.next
    end
    current.next = Node.new(data, nil)
  end

end
