#! /usr/bin/ruby

# Advent of Code 2023 Day 2 Part 1

MAX_CUBES = {
  'red'   => 12,
  'green' => 13,
  'blue'  => 14 }

total = File.readlines('aoc_2023-2.dat').each.sum do |line|
  valid_game = true
  game, rounds = line.split(": ")
  rounds.split(/; |, /).each do |cubes| # split on both at the same time
    cube = cubes.match /^(\d+) (red|green|blue)$/
    valid_game = cube[1].to_i > MAX_CUBES[cube[2]] ? false : valid_game
  end
  g = game.match /^Game (\d+)$/
  valid_game ? g[1].to_i : 0
end

puts("Sum of all valid games: #{total}")

