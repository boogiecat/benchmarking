require 'benchmark'
#MAX_VALUE = 1000 ITERATIONS=1 gives lazy segfault
#MAX_VALUE = 100 ITERATIONS=100 also gives lazy segfault
MAX_VALUE = 500
num_of_iterations = 50

def functional_approach n
  range = 1..Float::INFINITY
  range.lazy.select { |value| value.even? }.take(n).collect { |x| x ** 2 }.reduce(:*)
end

def imperative_approach n
  values = []
  for i in 1..n
    values << (i * 2)
  end
  squares = []

  for j in values
    squares << (j * j)
  end
  accumulator = 1
  for s in squares
    accumulator = accumulator * s
  end
end


Benchmark.bm do |x|
  x.report { num_of_iterations.times { functional_approach MAX_VALUE }}
  x.report { num_of_iterations.times { imperative_approach MAX_VALUE }}
end


#
#func 5
#non_func 5
