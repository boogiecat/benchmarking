require 'benchmark'
MAX_VALUE = 1000000
num_of_iterations = 100

def functional_approach n
  range = 1..Float::INFINITY
  range.lazy.select { |value| value.even? }.take(n)
end

def imperative_approach_1 n
  values = []
  (1..n).each do |i|
    values << (i * 2)
  end
  values
end

def imperative_approach_2 n
  values = []
  i = 0
  accumulator = 2
  while i < n
     values << accumulator
     i += 1
     accumulator += 2
  end
  values
end

def imperative_approach_3 n
  values = []
  (1..2*n).each do |elem|
    values << elem if elem.even?
  end
  values
end

Benchmark.bm do |x|
  x.report { num_of_iterations.times { functional_approach   MAX_VALUE }}
  x.report { num_of_iterations.times { imperative_approach_1 MAX_VALUE }}
  x.report { num_of_iterations.times { imperative_approach_2 MAX_VALUE }}
  x.report { num_of_iterations.times { imperative_approach_3 MAX_VALUE }}
end

#
#user     system      total        real
#0.000000   0.000000   0.000000 (  0.001392)
#9.960000   0.340000  10.300000 ( 10.305239)
#7.540000   0.340000   7.880000 (  7.874150)
#18.430000   0.330000  18.760000 ( 18.759894)