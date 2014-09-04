require 'byebug'
TRANS_PATH = File.expand_path(File.dirname(__FILE__) + '/../data/SAMPLE_TRANS.csv')
RATES_PATH = File.expand_path(File.dirname(__FILE__) + '/../data/SAMPLE_RATES.xml')
require_relative "../lib/trade"