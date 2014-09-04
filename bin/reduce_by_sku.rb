TRANS_PATH = File.expand_path(File.dirname(__FILE__) + '/../data/TRANS.csv')
RATES_PATH = File.expand_path(File.dirname(__FILE__) + '/../data/RATES.xml')
require_relative '../lib/trade'
require "benchmark"

puts Benchmark.measure { Trade::Reducer.call('DM1182', 'USD') }