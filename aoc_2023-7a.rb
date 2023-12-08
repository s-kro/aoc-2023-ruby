#! /usr/bin/ruby

# Advent of Code 2023 Day 7 Part 1

CARD_RANK = %w[A K Q J T 9 8 7 6 5 4 3 2]
game = Array.new
File.readlines('aoc_2023-7.dat').each do |hb| # group into same cards,
  hand, bid = hb.split(' ') # ... join the same cards together, then sort the 'of a kinds' to first by size
  sh = hand.chars.sort_by{|a| CARD_RANK.find_index(a.to_s)}.chunk{|c|c}.map{|n, a| a.join}.sort_by{|a| -a.length}
  game.push [sh, hand.chars, bid] # tiebreakers are against the hands as originally dealt, so we'll keep them 
end

tw = game.sort_by{|a| [a[0][0].length, a[0][1].to_s.length, # a[0] = sorted hand array (sh)
                       -CARD_RANK.find_index(a[1][0].to_s), # a[1] = hand as dealt (hand)
                       -CARD_RANK.find_index(a[1][1].to_s),
                       -CARD_RANK.find_index(a[1][2].to_s),
                       -CARD_RANK.find_index(a[1][3].to_s),
                       -CARD_RANK.find_index(a[1][4].to_s)]}
       .each_with_index.sum do |h, i|
  i.next * h[2].to_i
end

puts("Total winnings: #{tw}")

