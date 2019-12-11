insert_sort_step = -> (n) { 8 * n ** 2 }
merge_sort_step = -> (n) { 64 * n * Math.log2(n) }

p (2..).take_while { |n| insert_sort_step[n] < merge_sort_step[n] }
