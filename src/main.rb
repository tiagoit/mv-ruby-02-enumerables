#!/usr/bin/env ruby
# frozen_string_literal: true

require './enumerable'

array = [1, 2, 3, 4]

# EACH
# puts [].my_each
# puts array.my_each
# puts([].each { |obj| puts obj })
# array.my_each { |obj| puts obj }

# puts((1..5).my_each)
# (1..5).my_each { |obj| puts obj }

# EACH_WITH_INDEX
# puts [].each_with_index
# puts array.each_with_index
# puts(array.each_with_index { |obj, i| puts "#{i} #{obj}"})

# puts((1..5).my_each_with_index)
# puts((1..5).my_each_with_index { |obj, i| puts "#{i} #{obj}"})

# SELECT
# puts [].my_select
# puts array.my_select
# puts(array.my_select { |obj| obj >= 2 })

# ALL?
# puts [].my_all? # true
# puts array.my_all? # true
# puts(array.my_all? { |obj| obj > 1 }) # false
# puts

# array = %w[a a a a]
# puts array.my_all?('a') # true
# array = %w[a a a b]
# puts array.my_all?('a') # false
# array = [1, 2, 3, 4]
# puts array.my_all?(Numeric) # true
# array = [1, 2, 3, '4']
# puts array.my_all?(Numeric) # false
# array = %w[Tiago Tiago Tiago]
# puts array.my_all?(/T\w+/) # true
# puts array.my_all?(/d/) # false
# puts

# array = [5, 5, 5, 5]
# puts array.my_all?(5) # true

# ANY?
# puts [].my_any? # false
# puts array.my_any? # true
# puts(array.my_any? { |obj| obj > 1 }) # true
# puts

# array = %w[a a a a]
# puts array.my_any?('a') # true
# array = %w[a a a b]
# puts array.my_any?('a') # true
# array = [1, 2, 3, 4]
# puts array.my_any?(Numeric) # true
# array = [1, 2, 3, '4']
# puts array.my_any?(Numeric) # true
# array = %w[Tiago Tiago Tiago]
# puts array.my_any?(/T\w+/) # true
# puts array.my_any?(/d/) # false

# NONE
# puts [].my_none? # true
# puts array.my_none? # false
# puts(array.my_none? { |obj| obj > 1 }) # false
# puts

# array = %w[a a a a]
# puts array.my_none?('a') # false
# array = %w[a a a b]
# puts array.my_none?('a') # false
# array = [1, 2, 3, 4]
# puts array.my_none?(Numeric) # false
# array = [1, 2, 3, '4']
# puts array.my_none?(Numeric) # false
# array = %w[Tiago Tiago Tiago]
# puts array.my_none?(/T\w+/) # false
# puts array.my_none?(/d/) # true
# puts

# puts([1, 2, 3, 4].my_none?(5)) # true
# puts([1, 2, 3, 4, 5].my_none?(5)) # false

# COUNT
# puts [].my_count # 0
# puts array.my_count # 4
# puts(array.my_count { |obj| obj > 1 }) # 3
# puts

# array = %w[a a a a]
# puts array.my_count('a') # 4
# array = %w[a a a b]
# puts array.my_count('a') # 3

# INJECT
# puts(array.my_inject) # should raise no block error

# # Inject { block }
# puts(array.my_inject { |acc, item| acc + item }) # 10
# puts(array.my_inject { |acc, item| acc * item }) # 24
# # Inject (initial) { block }
# puts(array.my_inject(10) { |acc, item| acc + item }) # 20
# puts(array.my_inject(10) { |acc, item| acc * item }) # 240

# # # Inject (sym)
# puts(array.my_inject(:+)) # 10
# puts(array.my_inject(:*)) # 24
# # Inject (initial, sym)
# puts(array.my_inject(10, :+)) # 20
# puts(array.my_inject(10, :*)) # 240

# 10 - Test your #my_inject by creating a method called #multiply_els which multiplies all the
# elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
# def multiply_els arr
#   arr.my_inject(1) { |acc, item| acc * item }
# end
# puts multiply_els(arr);

# 11 - Modify your #my_map method to take a proc instead.
# puts arr.my_map(proc_gr_eq2)

# 12 - Modify your #my_map method to take either a proc or a block.
# puts(arr.my_none? { |item| item >= 2 })
# puts
# proc_gr_eq2 = proc { |item| item >= 2 }
# puts arr.my_map(&proc_gr_eq2)
