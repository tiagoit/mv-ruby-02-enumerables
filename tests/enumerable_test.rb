#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/enumerable'

# Common test data version: 2.1.0 00dda3a
class EnumerableTest < Minitest::Test
  def test_my_each_on_empty_array_without_block
    assert_instance_of Enumerator, [].my_each
  end

  def test_my_each_without_block
    assert_instance_of Enumerator, [1, 2, 3].my_each
  end

  def test_my_each
    assert_output(/1\n2\n3\n/) { [1, 2, 3].my_each { |obj| puts obj } }
  end
end
