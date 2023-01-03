
require './lib/receipt'
require './lib/reader'
require './lib/order/item'
require './lib/order/list'
require './lib/tax/base'
require './lib/tax/basic'
require './lib/tax/import'
require './lib/tax/sales'

input1 = [
  '2 book at 12.49',
  '1 music CD at 14.99',
  '1 chocolate bar at 0.85'
]
input2 = [
  '1 imported box of chocolates at 10.00',
  '1 imported bottle of perfume at 47.50'
]
input3 = [
  '1 imported bottle of perfume at 27.99',
  '1 bottle of perfume at 18.99',
  '1 packet of headache pills at 9.75',
  '3 imported boxes of chocolates at 11.25'
]

reader = Reader.new(input: input1)
reader.output

reader.input = input2
reader.output

reader.input = input3
reader.output
