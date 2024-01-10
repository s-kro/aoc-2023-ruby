#! /usr/bin/ruby

# Advent of Code 2023 Day 16 Part 1

NN = {'^' => {:p => [-1, 0], # next node,  [y, x] !
              :d => {'\\' => '<', '/' => '>', '.' => '^', '|' => '^', '-' => '<>'}},
     
      '>' => {:p => [0, 1],
              :d => {'\\' => 'v', '/' => '^', '.' => '>', '-' => '>', '|' => 'v^'}},

      'v' => {:p => [1, 0],
              :d => {'\\' => '>', '/' => '<', '.' => 'v', '|' => 'v', '-' => '<>'}},

      '<' => {:p => [0, -1],
              :d => {'\\' => '^', '/' => 'v', '.' => '<', '-' => '<', '|' => 'v^'}}}

CL = [] # contraption layout
File.open('aoc_2023-16.dat').readlines.each do |y|
  CL.push y.strip.chars
end

W = CL[0].length - 1 # map width
L = CL.length    - 1 # ... and length

Q = [[[0, 0], NN['>'][:d][CL[0][0]]]] # queue
V = []                                # visited?

energized = [[0, 0]] # energised tiles

while !Q.empty?
  p, d = Q.pop # position, direction

  loop do
    np = [p, NN[d][:p]].transpose.map(&:sum) # next position
    break unless np[0].between?(0, L) && np[1].between?(0, W)
    energized.push np
    d = NN[d][:d][CL[np[0]][np[1]]]
    if d.chars.length > 1 then # beam splitter
      q = [np, d.chars[1]]
      if !V.include? q then
        Q.push q 
        V.push q
      end
      d = d.chars[0]
    end
    p = np
  end
  energized.uniq!
end
p energized.length
