#!/usr/bin/env ruby
# ./spec/enumerable_spec.rb
# frozen_string_literal: true

require './lib/enumerable'

RSpec.describe Enumerable do
  describe '#my_each' do
    it 'iterate on arrays' do
      expect { [1, 2].my_each { |obj| print obj } }.to output('12').to_stdout
    end

    it 'iterate on ranges' do
      expect { (1..2).my_each { |obj| print obj } }.to output('12').to_stdout
    end

    it 'return empty array' do
      expect([].my_each { |obj| puts obj }).to eql([])
    end

    it 'return Enumerator if no block is given' do
      expect([1, 2].my_each).to be_a(Enumerator)
    end
  end

  describe '#my_each_with_index' do
    it 'iterate on arrays' do
      expect { [1, 2].my_each_with_index { |obj, i| print "#{i}:#{obj} " } }.to output('0:1 1:2 ').to_stdout
    end

    it 'iterate on ranges' do
      expect { (1..2).my_each_with_index { |obj, i| print "#{i}:#{obj} " } }.to output('0:1 1:2 ').to_stdout
    end

    it 'return empty array' do
      expect([].my_each_with_index { |obj, i| puts obj + i }).to eql([])
    end

    it 'return Enumerator if no block is given' do
      expect([1, 2].my_each_with_index).to be_a(Enumerator)
    end
  end

  describe '#my_select' do
    it 'return subarray with selected elements' do
      expect([1, 2].my_select { |obj| obj > 1 }).to eql([2])
    end

    it 'return subarray with selected elements from range' do
      expect((1..2).my_select { |obj| obj > 1 }).to eql([2])
    end

    it 'return empty array' do
      expect([].my_select { |obj, i| puts obj + i }).to eql([])
    end

    it 'return Enumerator if no block is given' do
      expect([1, 2].my_select).to be_a(Enumerator)
    end
  end

  describe '#my_all?' do
    it 'return true if empty array and no block' do
      expect([].my_all?).to be_truthy
    end

    it 'return true if empty array and any block' do
      expect([].my_all? { |obj| obj == 8273 }).to be_truthy
    end

    it 'return true if all elements of array match condition' do
      expect([1, 2].my_all? { |obj| obj > 0 }).to be_truthy
    end

    it 'return false if any elements of array don\'t match condition' do
      expect(%w[a a b].my_all? { |obj| obj.eql?('a') }).to be_falsy
    end

    it 'return true if all elements of range match condition' do
      expect((1..2).my_all? { |obj| obj > 0 }).to be_truthy
    end

    it 'return true if all elements of range match Type condition' do
      expect((1..2).my_all?(Numeric)).to be_truthy
    end

    it 'return true if all elements of array match pattern condition' do
      expect(%w[Tia Tib Tic].my_all?(/T\w+/)).to be_truthy
    end

    it 'return true if all elements of array match regular equality' do
      expect([5, 5].my_all?(5)).to be_truthy
    end
  end

  describe '#my_any?' do
    it 'return false if empty array and no block' do
      expect([].my_any?).to be_falsy
    end

    it 'return false if empty array and any block' do
      expect([].my_any? { |obj| obj == 8273 }).to be_falsy
    end

    it 'return true if any element of array match' do
      expect([1, 2].my_any? { |obj| obj > 0 }).to be_truthy
    end

    it 'return true even if one element of array don\'t match' do
      expect(%w[a a b].my_any? { |obj| obj.eql?('a') }).to be_truthy
    end

    it 'return true if any element of range match' do
      expect((1..2).my_any? { |obj| obj > 0 }).to be_truthy
    end

    it 'return true if any element of arary match Type' do
      expect([1, 'a'].my_any?(Numeric)).to be_truthy
    end

    it 'return true if any element of array match pattern' do
      expect(%w[Tia Ria Dia].my_any?(/T\w+/)).to be_truthy
    end

    it 'return true if any element of array match regular equality' do
      expect([5, 6].my_any?(5)).to be_truthy
    end
  end

  describe '#my_none?' do
    it 'return true if empty array and no block' do
      expect([].my_none?).to be_truthy
    end

    it 'return true if empty array and any block' do
      expect([].my_none? { |obj| obj == 8273 }).to be_truthy
    end

    it 'return true if no elements of array match' do
      expect([1, 2].my_none? { |obj| obj < 0 }).to be_truthy
    end

    it 'return false if one element of array match' do
      expect(%w[a b b].my_none? { |obj| obj.eql?('a') }).to be_falsy
    end

    it 'return false if any element of range match' do
      expect((1..2).my_none? { |obj| obj > 1 }).to be_falsy
    end

    it 'return false if any element of arary match Type' do
      expect([1, 'a'].my_none?(Numeric)).to be_falsy
    end

    it 'return false if any element of array match pattern' do
      expect(%w[Tia Ria Dia].my_none?(/T\w+/)).to be_falsy
    end

    it 'return false if any element of array match regular equality' do
      expect([5, 6].my_none?(5)).to be_falsy
    end
  end

  describe '#my_count' do
    it 'return zero on empty array' do
      expect([].my_count).to eql(0)
    end

    it 'return the number of elements on array when no block' do
      expect([1, 2].my_count).to eql(2)
    end

    it 'count elements on array that matches block condition' do
      expect([1, 2].my_count { |obj| obj > 1 }).to eql(1)
    end

    it 'count elements on literal array that matches block condition' do
      expect(%w[a a b].my_count('a')).to eql(2)
    end
  end

  describe '#my_inject' do
    it 'accumulates the items on array with the block operation' do
      expect([1, 2].my_inject { |acc, obj| acc + obj }).to eql(3)
    end

    it 'accumulates the items on range with the block operation' do
      expect((1..2).my_inject { |acc, obj| acc + obj }).to eql(3)
    end

    it 'accumulates the items on range with the symbol and initial' do
      expect(Range.new(1, 2).my_inject(2, :*)).to eql(4)
    end
  end
end
