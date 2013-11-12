require '../utilities/data_generator.rb'
require '../utilities/constants.rb'
require 'benchmark'

num_of_iterations = 1000000

functional_sample = generate_array(1000, 10)
imperative_sample = functional_sample.clone

nils = generate_nils(100)
rest = generate_array(100, 10)
nils.each do |element|
  rest << element
end


Benchmark.bm do |x|
  x.report {
    num_of_iterations.times do
      [functional_sample, rest].compact
    end
  }
  x.report {
    num_of_iterations.times do
      rest.each do |element|
        imperative_sample << element unless element.nil?
      end
    end
  }
end


