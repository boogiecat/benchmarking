require 'benchmark'
num_of_iterations = 1000000

functional_phone_numbers = {:mom => 1, :dad => 2, :wife => 4,
                            :ex_wife => 5, :pizza_delivery => 6}
imperative_phone_numbers = functional_phone_numbers.clone

Benchmark.bm do |x|
  x.report {
    num_of_iterations.times {
      functional_phone_numbers.merge({:girlfriend => 7}) }
  }
  x.report {
    num_of_iterations.times {
      imperative_phone_numbers[:girlfriend] = 7 }
  }
end
#
#user     system      total        real
#2.320000   0.120000   2.440000 (  2.441960)
#0.140000   0.000000   0.140000 (  0.137593)