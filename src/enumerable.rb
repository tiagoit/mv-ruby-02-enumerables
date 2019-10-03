#!/usr/bin/env ruby
# frozen_string_literal: true

module Enumerable
  def my_each
    length.times do |i|
      yield(self[i])
    end
  end

  def my_each_with_index
    length.times do |i|
      yield(self[i], i)
    end
  end

  def my_select
    selected_items = []
    my_each do |item|
      selected_items << item if yield(item)
    end
    selected_items
  end

  def my_all?
    my_each { |item| return false unless yield(item) }
    true
  end

  def my_any?
    my_each { |item| return true if yield(item) }
    false
  end

  def my_none?
    my_each { |item| return false if yield(item) }
    true
  end

  def my_count
    count = 0
    my_each { |item| count += 1 if yield(item) }
    count
  end

  # 11 - Modify your #my_map method to take a proc instead.
  # def my_map(proc)
  #   result = []
  #   my_each { |item| result << proc.call(item) }
  #   result
  # end

  def my_map
    result = []
    my_each { |item| result << yield(item) }
    result
  end

  def my_inject(acc = 0)
    my_each { |item| acc = yield(acc, item) }
    acc
  end
end

arr = [1, 2, 3, 4]

# arr.my_each do |item|
#   puts item
# end

# arr.my_each_with_index do |item, index|
#   puts index.to_s << ' ' << item.to_s
# end

# arr = arr.my_select do |item|
#   item >= 2
# end
# puts arr

# puts arr.my_all?(&:positive?)
# puts arr.my_any? { |item| item > 2 }
# puts arr.my_none? { |item| item > 2 }
# puts arr.my_count { |item| item >= 2 }
# puts arr.my_inject { |acc, item| acc + item }

# 10 - Test your #my_inject by creating a method called #multiply_els which multiplies all the
# elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
# def multiply_els arr
#   arr.my_inject(1) { |acc, item| acc * item }
# end
# puts multiply_els(arr);

# 11 - Modify your #my_map method to take a proc instead.
# puts arr.my_map(proc_gr_eq2)

# 12 - Modify your #my_map method to take either a proc or a block.
puts arr.my_map { |item| item >= 2 }
puts
proc_gr_eq2 = proc { |item| item >= 2 }
puts arr.my_map(&proc_gr_eq2)
