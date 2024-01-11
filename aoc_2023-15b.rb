#! /usr/bin/ruby

# Advent of Code 2023 Day 15 Part 2

LB = Array.new(256) {Array.new} # lens boxes

File.open('aoc_2023-15.dat').readline.split(',').each do |is|
  l, o, fl = is.match(/([a-z]+)(-|=)(\d?)/).captures # label, operation, focal length
  i = l.each_byte.inject(0) {|sum, cv| (sum + cv) * 17 % 256} # initializtion sequence
  
  case o # operation
  when '=' # place lense in relavent box
    if LB[i].any? {|r| r[0] == l} then # replace
      LB[i][LB[i].index {|r| r[0] == l}] = [l, fl]
    else # place
      LB[i].push [l, fl]
    end
  when '-' # remove lens
    LB[i].reject! {|r| r[0] == l}
  end
end

p LB.each_with_index.inject(0) {|sum, (lb, i)|
  sum + lb.each_with_index.inject(0){|sum, ((_, fl), j)|
    sum + (i + 1) * (j + 1) * fl.to_i}}


