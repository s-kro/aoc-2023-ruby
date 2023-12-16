#! /usr/bin/ruby

# Advent of Code 2023 Day 13 Part 2

def check_smudge (a, b)
  return a.chars.select.each_with_index { |c, index| 
    b[index] != c}.size == 1
end

def find_mirror (mv)
  mr = 0
  mr_prev = [0] # previously tried mirror rows
  mv.each do |_|
    smudge = false
    mr = 0 # mirror row
    mv.each_with_index do |r, mv_i|
      if (mr == 0 && r == mv[mv_i - 1] \
          && !(mr_prev.include? mv_i)) then
        mr = mv_i
      elsif (mr == 0 && check_smudge(r, mv[mv_i - 1]) \
             && !(mr_prev.include? mv_i)) then
        mr = mv_i
        smudge = true
      elsif (mr > 0 && 2 * mr > mv_i) # row we're mirroring against is still
        if r.strip == mv[2 * mr - mv_i - 1].strip then # ... on tbe grid?
        elsif check_smudge(r, mv[2 * mr - mv_i - 1]) && !smudge then
          smudge = true
        else # fails the mirror check 
          mr_prev.push mr
          smudge = false
          mr = 0
        end
      end
     end
    mr_prev.push mr if !smudge && mr > 0
    #break if smudge == 1 && mr > 0
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
