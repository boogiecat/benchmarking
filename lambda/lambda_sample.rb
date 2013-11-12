require 'benchmark'
num_of_iterations = 100
max_value = 1000000

Benchmark.bm do |x|
  x.report {
    num_of_iterations.times {
      (0..max_value).map &lambda { |i| i * i }
    }
  }
  x.report {
    num_of_iterations.times {
      list = []
      (1..max_value).each { |i|
        list << (i * i)
      }
    }
  }
end

#user     system      total        real
#10.830000   0.330000  11.160000 ( 11.163559)
#10.040000   0.310000  10.350000 ( 10.347314)