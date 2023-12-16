#! /usr/bin/ruby

# Advent of Code 2023 Day 10 Part 1

PIPE_SEGMENTS = {'|' => {'N' => {'X' =>  0, 'Y' => -1, 'D' => 'N'}, # vertical pipe connecting north and south.
                         'S' => {'X' =>  0, 'Y' =>  1, 'D' => 'S'}},
                 '-' => {'W' => {'X' => -1, 'Y' =>  0, 'D' => 'W'}, # horizontal pipe connecting east and west.
                         'E' => {'X' =>  1, 'Y' =>  0, 'D' => 'E'}},
                 'L' => {'S' => {'X' =>  1, 'Y' =>  0, 'D' => 'E'}, # 90-degree bend connecting north and east.
                         'W' => {'X' =>  0, 'Y' => -1, 'D' => 'N'}},
                 'J' => {'S' => {'X' => -1, 'Y' =>  0, 'D' => 'W'}, # 90-degree bend connecting north and west.
                         'E' => {'X' =>  0, 'Y' => -1, 'D' => 'N'}},
                 '7' => {'E' => {'X' =>  0, 'Y' =>  1, 'D' => 'S'}, # 90-degree bend connecting south and west.
                         'N' => {'X' => -1, 'Y' =>  0, 'D' => 'W'}},
                 'F' => {'W' => {'X' =>  0, 'Y' =>  1, 'D' => 'S'}, # 90-degree bend connecting south and east.
                         'N' => {'X' =>  1, 'Y' =>  0, 'D' => 'E'}}}
     
pipes = []
File.readlines('aoc_2023-10.dat').each do |x|
  pipes.push x.strip
end

s = [] # our litte squirrel
pipes.each_with_index do |py, y| 
  py.chars.each_with_index do |p, x|
    if  (p  == 'S') then
      [[0, -1, 'N'], [0, 1, 'S'], [1, 0, 'E'], [-1, 0, 'W']].each do |dx, dy, dir|
        ps = pipes[y + dy][x + dx]
        s =  [x + dx, y + dy, dir] if (dir == 'N' && (ps == '|' || ps == 'F' || ps == '7')) \
                           || (dir == 'S' && (ps == '|' || ps == 'L' || ps == 'J')) \
                           || (dir == 'E' && (ps == '-' || ps == '7' || ps == 'J')) \
                           || (dir == 'W' && (ps == '-' || ps == 'L' || ps == 'F'))
     end
    end
  end
end

(1..).each do |i| # we'll just loop around to the beginning and divide by 2
  ps = pipes[s[1]][s[0]] # next pipe segment
  if (ps == 'S') then
    p i
    p i / 2
    break
  end
  s[0] += PIPE_SEGMENTS[ps][s[2]]['X']
  s[1] += PIPE_SEGMENTS[ps][s[2]]['Y']
  s[2]  = PIPE_SEGMENTS[ps][s[2]]['D']
end
