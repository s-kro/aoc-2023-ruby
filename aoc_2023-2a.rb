#! /usr/bin/ruby

# Advent of Code 2023 Day 2 Part 1

MAX_CUBES = {
  'red'   => 12,
  'green' => 13,
  'blue'  => 14 }

total = File.readlines('aoc_2023-2.dat').each.sum do |line|
  valid_game = true
  s = line.split(": ")
  s[1].split("; ").each do |game|
    game.split(", ").each do |cubes|
      c = cubes.match /^(\d+) (red|green|blue)$/
      if c[1].to_i > MAX_CUBES[c[2]]
        valid_game = false
        break 
      end
    end
  end
  g = s[0].match /^Game (\d+)$/
  valid_game ? g[1].to_i : 0
end

puts("Sum of all valid games: #{total}")

