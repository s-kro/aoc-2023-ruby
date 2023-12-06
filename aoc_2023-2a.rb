#! /usr/bin/ruby

# Advent of Code 2023 Day 2 Part 1

max_cubes = {
  'red'   => 12,
  'green' => 13,
  'blue'  => 14 }

total = 0 # sum of all valid games
File.readlines('aoc_2023-2.dat').each do |line|
  valid_game = true
  s = line.split(": ")
  s[1].split("; ").each do |game|
    game.split(", ").each do |cubes|
      c = cubes.match /^(\d+) (red|green|blue)$/
      if c[1].to_i > max_cubes[c[2]]
        valid_game = false
        break # can't break out of a nested loop
      end
    end
  end
  if valid_game
    g = s[0].match /^Game (\d+)$/
    total += g[1].to_i
  end
end

puts("Sum of all valid games: #{total}")

