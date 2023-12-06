#! /usr/bin/ruby

# Advent of Code 2023 Day 1 Part 1

total = 0 # sum of all calibration values
File.readlines('aoc_2023-1.dat').each do |line|
  m = line.match /^\D*(?=(\d)).*(\d)\D*$/
  total += m[1].to_i * 10 + m[2].to_i
end

puts("Sum of all calibration values: #{total}")

