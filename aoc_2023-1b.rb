#! /usr/bin/ruby

# Advent of Code 2023 Day 1 Part 2

text_to_i = {
  'zero'  => 0, # key the spelled number
  'one'   => 1, #  to its integer value
  'two'   => 2,
  'three' => 3,
  'four'  => 4,
  'five'  => 5,
  'six'   => 6,
  'seven' => 7,
  'eight' => 8,
  'nine'  => 9,
  '0'     => 0, # while we're here anyways, might as well
  '1'     => 1, #   index the digits too, as it will 
  '2'     => 2, #   save another sort in the loop
  '3'     => 3,
  '4'     => 4,
  '5'     => 5,
  '6'     => 6,
  '7'     => 7,
  '8'     => 8,
  '9'     => 9
  }

total = 0 # sum of all calibration values
re_cap = "(\\d|zero|one|two|three|four|five|six|seven|eight|nine)" # capture group

File.readlines('aoc_2023-1.dat').each do |line|  
  m = line.match /#{"^\\D*?(?=" + re_cap + ").*" + re_cap + "\\D*?$"}/
  total += text_to_i[m[1]] * 10 + text_to_i[m[2]]
end

puts("Sum of all calibration values: #{total}")
