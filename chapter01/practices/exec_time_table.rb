def find_limit_size_of_input(algo, limit, max)
  ok = 0
  ng = max || 10 ** 100

  while ng - ok > 1
    n = (ok + ng) / 2

    if algo[n] <= limit
      ok = n
    else
      ng = n
    end
  end

  ok
end

algo_list = [
  { text: 'log(n)', func: -> (n) { Math.log2(n) } },
  { text: '√n', func: -> (n) { Math.sqrt(n) } },
  { text: 'n', func: -> (n) { n } },
  { text: 'nlog(n)', func: -> (n) { n * Math.log2(n) } },
  { text: 'n^2', func: -> (n) { n ** 2 } },
  { text: 'n^3', func: -> (n) { n ** 3 } },
  { text: '2^n', func: -> (n) { 2 ** n }, max: 10000 },
  { text: 'n!', func: -> (n) { (1..n).inject(:*) }, max: 10000 },
]

limits = [
  1,                        # 1 sec
  60,                       # 1 min
  60 * 60,                  # 1 hour
  60 * 60 * 24,             # 1 day
  60 * 60 * 24 * 30,        # 1 month
  60 * 60 * 24 * 365,       # 1 year
  60 * 60 * 24 * 365 * 100, # 1 century
]

algo_list.each do |algo|
  puts algo[:text]

  p limits.map { |limit| find_limit_size_of_input(algo[:func], limit, algo[:max]) }
end
