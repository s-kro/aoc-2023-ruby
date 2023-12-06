#! /usr/bin/ruby

# Advent of Code 2023 Day 1 Part 2

TEXT_TO_D = {
  'zero'  => '0', # key the spelled number
  'one'   => '1', #  to its digit
  'two'   => '2',
  'three' => '3',
  'four'  => '4',
  'five'  => '5',
  'six'   => '6',
  'seven' => '7',
  'eight' => '8',
  'nine'  => '9',
  '0'     => '0', # we're here anyways, might as well
  '1'     => '1', #   index the actual digits too, as this
  '2'     => '2', #   will save another sort
  '3'     => '3',
  '4'     => '4',
  '5'     => '5',
  '6'     => '6',
  '7'     => '7',
  '8'     => '8',
  '9'     => '9'
  }

re_cap = "(\\d|zero|one|two|three|four|five|six|seven|eight|nine)" # capture group

total = File.readlines('aoc_2023-1.dat').each.sum do |line|  
  m = line.match /#{"^\\D*?(?=" + re_cap + ").*" + re_cap + "\\D*?$"}/
  "#{TEXT_TO_D[m[1]]}#{TEXT_TO_D[m[2]]}".to_i
end

puts("Sum of all calibration values: #{total}")
