# --- Day 3: Spiral Memory ---
#
# You come across an experimental new kind of memory stored on an infinite two-dimensional grid.
#
# Each square on the grid is allocated in a spiral pattern starting at a location marked 1 and then counting up while spiraling outward. For example, the first few squares are allocated like this:
#
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23---> ...
# While this is very space-efficient (no squares are skipped), requested data must be carried back to square 1
# (the location of the only access port for this memory system) by programs that can only move up, down, left, or right. They always take the shortest path: the Manhattan Distance between the location of the data and square 1.
#
# For example:
#
# Data from square 1 is carried 0 steps, since it's at the access port.
# Data from square 12 is carried 3 steps, such as: down, left, left.
# Data from square 23 is carried only 2 steps: up twice.
# Data from square 1024 must be carried 31 steps.
# How many steps are required to carry the data from the square identified in your puzzle input all the way to the access port?
#
# Your puzzle input is 361527.
# 37  36  35  34  33  32  31
# 38  17  16  15  14  13  30
# 39  18   5   4   3  12  29
# 40  19   6   1   2  11  28
# 41  20   7   8   9  10  27
# 42  21  22  23  24  25  26

# 1 4 15 34
#  3 11 19
#
# 4 - 1 + 8 + 4
# n2 - n1 + 8
#
# (15 - 4) + 8 + 15

#
# 1 3 13 31
#  2 10 18
#
#  8

# 1 7 21
#   6 14
#
# n2 = 7
# n1 = 1
# n2^2 - n1 + 8
#
# n2 = 8
# n1 = 1
# spot = 0
# i = 0

input = 277678

for n2 in [2, 4, 6, 8]
  n1 = 1
  i = 0
  spot = 0

  while spot < input do
    spot = ((n2*2) - n1) + 8
    n1 = n2
    n2 = spot
    i += 1
  end
  puts "i: #{i}, n2: #{n2}, n1: #{n1}"
  puts Math.sqrt(spot)
end


#
# --- Part Two ---
#
# As a stress test on the system, the programs here clear the grid and then store the value 1 in square 1. Then, in the same allocation order as shown above, they store the sum of the values in all adjacent squares, including diagonals.
#
# So, the first few squares' values are chosen as follows:
#
# Square 1 starts with the value 1.
# Square 2 has only one adjacent filled square (with value 1), so it also stores 1.
# Square 3 has both of the above squares as neighbors and stores the sum of their values, 2.
# Square 4 has all three of the aforementioned squares as neighbors and stores the sum of their values, 4.
# Square 5 only has the first and fourth squares as neighbors, so it gets the value 5.
# Once a square is written, its value does not change. Therefore, the first few squares would receive the following values:
#
# 304    5    4    2   57
# 330   10    1    1   54
# 351   11   23   25   26
# 362  747  806--->   ...
# What is the first value written that is larger than your puzzle input?
#
# Your puzzle input is still 361527.


# 147  142  133  122   59
# 304    5    4    2   57
# 330   10    1    1   54
# 351   11   23   25   26  1916
# 362  747  806   854  905 931

1, 23, 806
  22, 783


# 1 1 1
# 1 1 1
# 1 1 1
# 1 1 1
# 1 1 1
# 1 1 1


array = [1, 1, 2 ,4, 5, 10, 11, 23, 25, 26, 54, 57]
row_length = 4
offset = 10
while n < input
  if row_iter == row_length - 1
    array << array[array.length - 1] + array[array.length - offset]
    offset += 1
  elsif row_iter == row_length - 2
    array << array[array.length - 1] + array[array.length - offset] + array[array.length - offset - 1]
    offset += 1
  elsif row_iter == 1
    array << array[array.length - 1] + array[array.length - 2] + array[array.length - offset] + array[array.length - offset - 1]
    offset += 1
  elsif row_iter == 0
    array << array[array.length - 1] + array[array.length - offset]
    offset += 1
  else
    array << array[array.length - 1] + array[array.length - offset] + array[array.length - offset - 1] + array[array.length - offset - 2]
  end
end
# side one

# corner 26
array << array[array.length - 1] + array[array.length - 8]

#middle touching corner 54
array << array[array.length - 1] + array[array.length - 2] + array[array.length - 9] + array[array.length - 8]

# middle touching corner 57
array << array[array.length - 1] + array[array.length - 9] + array[array.length - 10]

# side two

# corner 59
array << array[array.length - 1] + array[array.length - 10]

# middle touching corner 122
array << array[array.length - 1] + array[array.length - 2] + array[array.length - 11] + array[array.length - 10]

# true middle 133
array << array[array.length - 1] + array[array.length - 12] + array[array.length - 11] + array[array.length - 10]

# middle touching corner 142
array << array[array.length - 1] + array[array.length - 12] + array[array.length - 11]

# corner 147
