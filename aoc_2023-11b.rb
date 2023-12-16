#! /usr/bin/ruby

# Advent of Code 2023 Day 11 Part 2

x_galaxies = []
galaxy_map = []
y_galaxy_inc = 0
exp = 1000000 - 1 # expansion factor
File.readlines('aoc_2023-11.dat').each_with_index do |y, i|
  no_x_galaxies = true
  y.strip.chars.each_with_index do |x, j|
    if (x == '#')
      x_galaxies.push j
      no_x_galaxies = false
      galaxy_map.push [j, i + y_galaxy_inc * exp]
    end
  end
  y_galaxy_inc += 1 if no_x_galaxies # an empty row
end

x_gal_shift = [] # a map of the new galaxy x positions
x_galaxy_inc = 0
(0 .. x_galaxies.uniq.sort.last).each do |x|
  x_galaxy_inc += 1 if !x_galaxies.include? x
  x_gal_shift.push x + x_galaxy_inc * exp
end

td = 0 # total distance
galaxy_map.each_with_index do |g1, i|
  galaxy_map.each_with_index do |g2, j|
    next if j <= i
    td += (x_gal_shift[g2[0]] - x_gal_shift[g1[0]]).abs + (g2[1] - g1[1]).abs
  end
end

p td
