frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/enumerable'

# Common test data version: 2.1.0 00dda3a
class EnumerableTest < Minitest::Test
  def test_my_each_without_block_nor_params
    assert_equal (1..5), ((1..5).my_each { |item| puts item })
  end
end
