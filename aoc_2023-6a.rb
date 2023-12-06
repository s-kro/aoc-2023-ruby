#! /usr/bin/ruby

# Advent of Code 2023 Day 6 Part 1
# Time:        54     70     82     75
# Distance:   239   1142   1295   1253

RACE = {
  '54' => 239,
  '70' => 1142,
  '82' => 1295,
  '75' => 1253 }

total = 1
RACE.each do |time, dist|
  rec = (1 .. time.to_i).each.sum do |t|
    time.to_i * t - t ** 2 > dist ? 1 : 0
  end
  total *= rec
end

puts("Number of ways to beat the race records: #{total}")

