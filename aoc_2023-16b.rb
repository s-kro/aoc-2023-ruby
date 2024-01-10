#! /usr/bin/ruby

# Advent of Code 2023 Day 16 Part 2

NN = {'^' => {:p => [-1, 0], # next node,  y, x order!
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

EDGE = [['v', 0, 1, 0, 0],
        ['^', 0, 1, 1, 0],
        ['>', 1, 0, 0, 0],
        ['<', 1, 0, 0, 1]]

W = CL[0].length - 1 # map width
L = CL.length    - 1 # ... and length
Q = []               # queue
V = []               # visited?

longest = 0
EDGE.each do |edge|
  ed, y, x, fey, fex = edge # edge direction, y, x, far edges
  CL[0].length.times do |r|
    nx = x * r + fex * W
    ny = y * r + fey * L 

    NN[ed][:d][CL[ny][nx]].chars.each do |nd|
      Q.push [[ny, nx], nd] # check for splitters
    end
    V.clear
    energized = [[ny, nx]] # energised tiles

    while !Q.empty?
      p, d = Q.pop # position, direction

      loop do
        np = [p, NN[d][:p]].transpose.map(&:sum) # next position
        break unless np[0].between?(0, L) && np[1].between?(0, W)
        energized.push np
        d = NN[d][:d][CL[np[0]][np[1]]]
        if d.chars.length > 1 then
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
    longest = [energized.length, longest].max
  end
end
p longest
