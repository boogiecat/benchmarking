require 'benchmark'
require '../utilities/data_generator.rb'
num_of_iterations = 1000000
functional_string = generate_string(10000)
imperative_string = functional_string.clone




Benchmark.bm do |x|
  x.report {
    num_of_iterations.times {
      functional_string.upcase
    }
  }
  x.report {
    num_of_iterations.times {
      imperative_string.upcase!
    }
  }
end

#user     system      total        real
#39.260000   0.050000  39.310000 ( 39.305786)
#9.500000   0.000000   9.500000 (  9.502950)