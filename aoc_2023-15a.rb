#! /usr/bin/ruby

# Advent of Code 2023 Day 15 Part 1

p File.open('aoc_2023-15.dat').readline.split(',').inject(0) {|sum, is|
  sum + is.each_byte.inject(0) {|sum, cv| (sum + cv) * 17 % 256}} # initializtion sequence

