# frozen_string_literal: true

require_relative '../Code/MGL7460_Projet_2_ruby'
require 'test-unit'

class TestMGL7460Projet2Ruby < Test::Unit::TestCase

  def test_parse_time
    expected_result = Struct.new(:days, :hours, :minutes).new
    expected_result.days = 173
    expected_result.hours = 8
    expected_result.minutes = 35

    actual_result = parse_time('15005117.05')
    assert_equal(expected_result.days, actual_result.days)
    assert_equal(expected_result.hours, actual_result.hours)
    assert_equal(expected_result.minutes, actual_result.minutes)
  end

  def test_read_file
    expected_read = '15005117.05 87200.26'

    assert_raise do
      read_file('test.txt')
    end
    assert_equal('', read_file('test/empty_file_test.txt'))
    assert_equal(expected_read, read_file('test/file_test.txt'))
  end

end