require '../utilities/data_generator.rb'
require 'benchmark'

LENGTH = 10000

functional_array = generate_boolean_array(LENGTH)
imperative_array = functional_array.clone

def functional_operations
  #functional_array.reduce(:)
end

