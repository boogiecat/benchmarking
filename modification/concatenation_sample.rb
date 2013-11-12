require 'benchmark'
#this should never happen

good_names = ['Kitty', 'Woody', 'Charles Philip Arthur Georg, Prince of Wales']
baad_names = ['Kitty', 'Woody', 'Charles Philip Arthur Georg, Prince of Wales']

def good_function(names)
  names.map do |name|
    "Greeting you, " + name
  end
end

def baad_function(names)
  names.each_with_index do |value, index|
    names[index] = "Greeting you, " + value
  end
end

Benchmark.bm do |x|
  x.report { 100000.times{ good_function good_names }}
  x.report { 100000.times {baad_function baad_names }}
end

#user     system      total        real
#0.140000   0.000000   0.140000 (  0.141035)
#54.400000  14.510000  68.910000 ( 68.932239)