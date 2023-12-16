#! /usr/bin/ruby

# Advent of Code 2023 Day 13 Part 1

def find_mirror (mv)
  mr = 0 # mirror row
  mv.each_with_index do |r, mv_i|
    if mr == 0 && r == mv[mv_i - 1] && mv_i  > 0 then
      mr = mv_i
    elsif mr > 0 && 2 * mr > mv_i && r != mv[2 * mr - mv_i - 1] then 
      mr = 0 # mirror check fails
    end
  end
  return mr
end

rs = 0
mirvol = []

File.readlines('aoc_2023-13.dat').each do |y|
  if y =~ /^\s*$/ then
    rs += 100 * find_mirror(mirvol) \
     + find_mirror(mirvol.each.map{|a| a.strip.chars}
                     .transpose.each.map{|a| a.join})
    mirvol = []
  else
    mirvol.push y.strip
  end
end
p rs
