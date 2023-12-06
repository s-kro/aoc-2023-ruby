#! /usr/bin/ruby

# Advent of Code 2023 Day 6 Part 2

T = 54708275
D = 239114212951253

rec = (1 .. T).each.sum do |t| # just brute force it!
  T * t - t ** 2 > D ? 1 : 0 
end

puts("Number of ways to beat the race record: #{rec}")

