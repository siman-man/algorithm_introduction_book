class Array
  def insert_sort
    result = Marshal.load(Marshal.dump(self))

    1.upto(result.size - 1) do |j|
      value = result[j]
      i = j - 1

      while i >= 0 && result[i] > value
        result[i + 1] = result[i]
        i -= 1
      end

      result[i + 1] = value
    end

    result
  end
end

nums = (1..100).to_a.shuffle

p nums.insert_sort
