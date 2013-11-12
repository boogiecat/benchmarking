require '../utilities/data_generator.rb'
require '../utilities/constants.rb'
require 'benchmark'

bench_num = 1000000

functional_invitees = %w(Mom Dad)
functional_girlfriend = 'Scartlett Johansson'

not_functional_invitees = %w(Mom Dad)
not_functional_girlfriend = 'Angela Merkel'

Benchmark.bm do |x|
  x.report {
    bench_num.times do
      [functional_invitees, functional_girlfriend].compact
    end
  }
  x.report {
    bench_num.times do
      not_functional_invitees << not_functional_girlfriend unless not_functional_girlfriend.nil?
    end
  }
end


