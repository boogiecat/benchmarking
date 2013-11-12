require '../utilities/data_generator.rb'
require 'benchmark'
#num_of_iterations = 100000
num_of_iterations = 1000

functional_hash = generate_hash(10000, 10, 20)
imperative_hash = functional_hash.clone
rest = generate_hash(100, 10, 20)

Benchmark.bm do |x|
  x.report {
    num_of_iterations.times {
      functional_hash.merge(rest) }
  }
  x.report {
    num_of_iterations.times {
      rest.keys.each do |key|
        imperative_hash[key] = rest[key]
      end
    }
  }
end
#
#N = 1000   iterations = 100000
#user     system      total        real
#33.330000   0.830000  34.160000 ( 34.176548)
#2.990000   0.020000   3.010000 (  3.005922)

#N = 10000 iterations 100
#user     system      total        real
#4.630000   0.100000   4.730000 (  4.728846)
#0.050000   0.000000   0.050000 (  0.052445)