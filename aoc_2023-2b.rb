#! /usr/bin/ruby

# Advent of Code 2023 Day 2 Part 2

total = File.readlines('aoc_2023-2.dat').each.sum do |line|
  min_cubes = { # ... is actually max cubes, but
    'red'   => 0, # it is posed as min cubes in
    'green' => 0, # the story
    'blue'  => 0 }

  s = line.split(": ")
  s[1].split("; ").each do |game| # could have split on both ; and , at
    game.split(", ").each do |cubes| # the same time, not sure if this is 
      c = cubes.match /^(\d+) (red|green|blue)$/ # possible
      min_cubes[c[2]] = [c[1].to_i, min_cubes[c[2]]].max
    end
  end
  min_cubes['red'] * min_cubes['green'] * min_cubes['blue']
end

puts("Sum of the power of all games: #{total}")

