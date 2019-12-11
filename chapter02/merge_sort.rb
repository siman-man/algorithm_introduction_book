class Array
  def merge_sort!(s = 0, t = size - 1)
    if s < t
      q = (s + t) / 2

      merge_sort!(s, q)
      merge_sort!(q + 1, t)
      merge(s, q, t)
    end
  end

  private

  def merge(s, q, t)
    l = self[s..q]
    r = self[(q + 1)..t]

    l << Float::INFINITY
    r << Float::INFINITY

    i = 0
    j = 0

    (s..t).each do |k|
      if l[i] <= r[j]
        self[k] = l[i]
        i += 1
      else
        self[k] = r[j]
        j += 1
      end
    end
  end
end

nums = (1..100).to_a.shuffle

nums.merge_sort!

p nums
