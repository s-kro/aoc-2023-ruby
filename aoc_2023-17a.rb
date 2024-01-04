#! /usr/bin/ruby

# Advent of Code 2023 Day 17 Part 1

require 'rb_heap'

def next_node()
  {'^' => {:p => [-1, 0], # [y, x] !
           :d => {:l => '<', :s => '^', :r => '>'}},
     
   '>' => {:p => [0, 1],
           :d => {:l => '^', :s => '>', :r => 'v'}},

   'v' => {:p => [1, 0],
           :d => {:l => '>', :s => 'v', :r => '<'}},

   '<' => {:p => [0, -1],
           :d => {:l => 'v', :s => '<', :r => '^'}}}
end

LM = [] # lava cooling map

File.open('aoc_2023-17.dat').readlines.each do |y|
  LM.push y.strip.chars.map{|x| x.to_i}
end

W = LM[0].length - 1 # map width
L = LM.length    - 1 # ... and length

checked = Set.new
Q = Heap.new {|a, b| (a <=> b) == -1} << [0, [0, 0], 'v'] << [0, [0, 0], '>']

while !Q.empty?
  hl, p, d = Q.pop
  
  (checked.include? [p, d]) ? next : checked << [p, d]

  pd = d.chars[-1] # previous direction "from"
  np = [p, next_node[pd][:p]].transpose.map(&:sum) # next position

  if np[0].between?(0, L) && np[1].between?(0, W) && d.chars.length <= 3 
  then
    hl += LM[np[0]][np[1]] # heat loss

    [:l, :s, :r].each do |t| # turns: left, straight, right
      nd =  next_node[pd][:d][t] # next direction
      rd = t == :s ? d + nd : nd
      if np == [L, W] then 
        puts hl
        return
      end
      Q << [hl, np, rd]
    end
  end
end
