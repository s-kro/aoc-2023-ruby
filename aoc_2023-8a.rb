#! /usr/bin/ruby

# Advent of Code 2023 Day 8 Part 1

ri = false # read the turns commands?
h = {} # hash of hashes
t = [] # turn instructions
File.readlines('aoc_2023-8.dat').each do |ins| #
  ri = ins =~ /$^/ ? true : ri # check for gap between turns and map
  if (ri && ins !~ /$^/) then
    node, l, r = /^(\w{3}) = \((\w{3}), (\w{3})\)$/.match(ins).captures
    h.store(node, {'L' => l, 'R' => r})
  elsif (ins !~ /$^/) then 
    t= ins.strip.chars
  end
end

node = 'AAA' # start position
t.cycle.with_index do |turn, i|
  node = h[node][turn]
  if (node == 'ZZZ') then
    p i.next
    break
  end
end
