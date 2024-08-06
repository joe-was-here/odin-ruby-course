# test_caesar_cipher.rb

require 'minitest/autorun'
require_relative 'app' # Ensure this path points to your implementation file

class TestCaesarCipher < Minitest::Test
  def test_caesar_cipher_with_positive_shift
    assert_equal "Khoor, Zruog!", caesar_cipher("Hello, World!", 3)
  end

  def test_caesar_cipher_with_negative_shift
    assert_equal "Ebiil, Tloia!", caesar_cipher("Hello, World!", -3)
  end

  def test_caesar_cipher_with_zero_shift
    assert_equal "Hello, World!", caesar_cipher("Hello, World!", 0)
  end

  def test_caesar_cipher_with_large_positive_shift
    assert_equal "Rovvy, Gybvn!", caesar_cipher("Hello, World!", 10)
  end

  def test_caesar_cipher_with_large_negative_shift
    assert_equal "Qnuux, Fxaum!", caesar_cipher("Hello, World!", -17)
  end

  # def test_caesar_cipher_with_non_alphabetic_characters
  #   assert_equal "1234!@#$", caesar_cipher("1234!@#$", 5)
  # end

  def test_caesar_cipher_wrap_around_lowercase
    assert_equal "abc", caesar_cipher("xyz", 3)
  end

  def test_caesar_cipher_wrap_around_uppercase
    assert_equal "XYZ", caesar_cipher("UVW", 3)
  end
end
