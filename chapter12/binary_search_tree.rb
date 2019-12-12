class BinarySearchTree
  Node = Struct.new(:value, :parent, :left, :right, keyword_init: true)
  NUL = Node.new(value: nil, parent: nil, left: nil, right: nil)

  def initialize
    @root = NUL
  end

  def insert(value)
    z = build_node(value)
    y = NUL
    x = @root

    while x != NUL
      y = x

      if z.value < x.value
        x = x.left
      else
        x = x.right
      end
    end

    z.parent = y

    if y == NUL
      @root = z
    elsif z.value < y.value
      y.left = z
    else
      y.right = z
    end
  end

  def delete(value)
    z = find(value)

    return if z == NUL

    if z.left == NUL
      transparent(z, z.right)
    elsif z.right == NUL
      transparent(z, z.left)
    else
      y = minimum(z.right)

      if y.parent != z
        transparent(y, y.right)
        y.right = z.right
        y.right.parent = y
      end

      transparent(z, y)
      y.left = z.left
      y.left.parent = y
    end
  end

  def walk(z = @root)
    if z.left != NUL
      walk(z.left)
    end

    puts z.value

    if z.right != NUL
      walk(z.right)
    end
  end

  private

  def find(value)
    z = @root

    while z != NUL && z.value != value
      if value < z.value
        z = z.left
      else
        z = z.right
      end
    end

    z
  end

  def transparent(u, v)
    if u.parent == NUL
      @root = v
    elsif u == u.parent.left
      u.parent.left = v
    else
      u.parent.right = v
    end

    if v != NUL
      v.parent = u.parent
    end
  end

  def successor(z)
    if z.right != NUL
      return minimum(z.right)
    end

    y = z.parent

    while y != NUL && z == y.right
      z = y
      y = y.parent
    end

    y
  end

  def minimum(z)
    while z.left != NUL
      z = z.left
    end

    z
  end

  def maximum(z)
    while z.right != NUL
      z = z.right
    end
  end

  def build_node(value)
     Node.new(value: value, parent: nil, left: NUL, right: NUL)
  end
end

bst = BinarySearchTree.new

nums = (1..10).to_a.shuffle

nums.each do |n|
  bst.insert(n)
end

bst.walk

