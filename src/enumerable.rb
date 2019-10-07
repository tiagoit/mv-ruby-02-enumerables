#!/usr/bin/env ruby
# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum unless block_given?

    length.times { |i| yield(self[i]) }
    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    length.times { |i| yield(self[i], i) }
    self
  end

  def my_select
    return to_enum unless block_given?

    selected = []
    my_each { |obj| selected << obj if yield(obj) }
    selected
  end

  def my_all?(pattern = nil)
    if block_given?
      my_each { |obj| return false unless yield(obj) }
    elsif pattern
      my_each do |obj|
        return false unless pattern_match?(obj, pattern)
      end
    else
      my_each { |obj| return false unless obj }
      true
    end
    true
  end

  def my_any?(pattern = nil)
    if block_given?
      my_each { |obj| return true if yield(obj) }
    elsif pattern
      my_each do |obj|
        return true if pattern_match?(obj, pattern)
      end
    else
      my_each { |obj| return true if obj }
    end
    false
  end

  def my_none?(pattern = nil)
    if block_given?
      my_each { |obj| return false if yield(obj) }
    elsif pattern
      my_each do |obj|
        return false if pattern_match?(obj, pattern)
      end
    else
      my_each { |obj| return false if obj }
    end
    true
  end

  def pattern_match?(obj, pattern)
    (pattern.is_a?(String) && obj.eql?(pattern)) ||
      (pattern.is_a?(Class) && obj.is_a?(pattern)) ||
      (pattern.is_a?(Regexp) && pattern.match(obj))
  end

  def my_count(item = nil)
    count = 0
    if block_given?
      my_each { |item_| count += 1 if yield(item_) }
    elsif item
      my_each { |item_| count += 1 if item_ == item }
    else
      count = length
    end
    count
  end

  # 11 - Modify your #my_map method to take a proc instead.
  # def my_map(proc)
  # return to_enum unless block_given?

  #   result = []
  #   my_each { |item| result << proc.call(item) }
  #   result
  # end

  def my_map
    return to_enum unless block_given?

    new_array = []
    my_each { |item| new_array << yield(item) }
    new_array
  end

  def my_inject(*args)
    initial, sym = prepare_params(*args, block_given?)

    array = initial ? self : self[1..-1]
    initial ||= self[0]
    if block_given?
      array.my_each { |item| initial = yield(initial, item) }
    elsif sym
      array.my_each { |item| initial = initial.public_send(sym, item) }
    end
    initial
  end

  def prepare_params(*args, block)
    initial, sym = nil
    args.each do |arg|
      initial = arg if arg.is_a? Numeric
      sym = arg unless arg.is_a? Numeric
    end

    raise LocalJumpError 'no block given' unless block || initial || sym

    [initial, sym]
  end
end
