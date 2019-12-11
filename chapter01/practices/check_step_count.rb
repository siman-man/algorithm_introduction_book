# 1.2-2
insert_sort_step = -> (n) { 8 * n ** 2 }
merge_sort_step = -> (n) { 64 * n * Math.log2(n) }

p (2..).take_while { |n| insert_sort_step[n] < merge_sort_step[n] }

# 1.2-3
algo_a = -> (n) { 100 * n ** 2 }
algo_b = -> (n) { 2 ** n }

p (1..).find { |n| algo_a[n] < algo_b[n] }
