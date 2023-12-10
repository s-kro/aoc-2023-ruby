#! /usr/bin/ruby

# Advent of Code 2023 Day 8 Part 2

ri = false # read the turns commands?
h = {} # hash of hashes
t = [] # turn instructions
File.readlines('aoc_2023-8.dat').each do |ins| #
  ri = ins =~ /$^/ ? true : ri # check for the empty line  between turns and map
  if (ri && ins !~ /$^/) then
    node, l, r = /^(\w{3}) = \((\w{3}), (\w{3})\)$/.match(ins).captures
    h.store(node, {'L' => l, 'R' => r}) # store as a hash of hashes
  elsif (ins !~ /$^/) then 
    t = ins.strip.chars
  end
end

z = [] # Z count storage
h.keys.select{|a| a =~ /\w\wA/}.each do |node|
  t.cycle.with_index do |turn, i| # walk through 
    node = h[node][turn] # ... the map
    if (node =~ /\w\wZ/) then # finally, a Z!!
      z.append i.next
      break
    end
  end
end
  
p z.inject(:lcm) # least common multiple

