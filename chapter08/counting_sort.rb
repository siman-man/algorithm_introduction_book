def counting_sort(a)
  k = a.max
  b = []
  c = []

  a.each do |i|
    c[i] = c[i].to_i + 1
  end

  (1..k).each do |i|
    c[i] = c[i-1].to_i + c[i].to_i
  end

  a.each do |j|
    b[c[j]-1] = j
    c[j] -= 1
  end

  b
end

a = Array.new(10){ rand(100) }
p a

b = counting_sort(a)
p b
