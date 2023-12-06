#! /usr/bin/ruby

# Advent of Code 2023 Day 2 Part 2

total = File.readlines('aoc_2023-2.dat').each.sum do |line|
  min_cubes = { # ... is actually max cubes, but
    'red'   => 0, # it is posed as min cubes in
    'green' => 0, # the story
    'blue'  => 0 }

  game, rounds = line.split(": ")
  rounds.split(/; |, /).each do |cubes| # split on both '; ' and ', ' at
    cube = cubes.match /^(\d+) (red|green|blue)$/ # the same time, as the actual
    min_cubes[cube[2]] = [cube[1].to_i, min_cubes[cube[2]]].max # 'round' is irrelivant
  end
  min_cubes['red'] * min_cubes['green'] * min_cubes['blue']
end

puts("Sum of the power of all games: #{total}")

