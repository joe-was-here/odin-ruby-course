# test_substrings.rb

require 'minitest/autorun'
require_relative 'app'

class TestSubstrings < Minitest::Test
  def setup
    @dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
  end

  def test_single_occurrence
    assert_equal({"below" => 1, "low" => 1}, substrings("below", @dictionary))
  end

  def test_multiple_occurrences
    assert_equal({"how" => 2, "howdy" => 1, "it" => 1, "i" => 3, "going" => 1, "go" => 1}, substrings("Howdy, how is it going?", @dictionary))
  end

  def test_case_insensitivity
    assert_equal({"down" => 1, "own" => 1}, substrings("DoWn", @dictionary))
  end

  def test_no_occurrences
    assert_equal({}, substrings("hello", @dictionary))
  end

  def test_full_sentence
    result = {
      "down" => 1,
      "how" => 2,
      "it" => 2,
      "i" => 5,
      "going" => 1,
      "go" => 1,
      "own" => 1,
      "part" => 1,
      "partner" => 1,
      "howdy" => 1
    }
    assert_equal(result, substrings("Howdy partner, how is it going? Down it is.", @dictionary))
  end
end
