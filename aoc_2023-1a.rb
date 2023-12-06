#! /usr/bin/ruby

# Advent of Code 2023 Day 1 Part 1

total = File.readlines('aoc_2023-1.dat').each.sum do |line|
  m = line.match /^\D*(?=(\d)).*(\d)\D*$/
  "#{m[1]}#{m[2]}".to_i
end

puts("Sum of all calibration values: #{total}")

