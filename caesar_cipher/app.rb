def only_letters?(string)
  /^[A-Za-z]+$/.match?(string)
end

def is_capital?(ordinal)
  ordinal.between?(65, 90)
end

def shift_letter(char, shift)
  # Get the integer
  ordinal = char.ord
  # Capital letters start at 65, lowercase at 97
  base_number = is_capital?(ordinal) ? 65 : 97
  # Switch ordinal to 0-25 for easing my human mind
  ordinal -= base_number
  # Shift the ordinal
  ordinal += shift
  # mod 26 for the wrap
  ordinal = ordinal % 26
  # Add the base back and return
  ordinal += base_number
  # Return the letter
  ordinal.chr
end

def caesar_cipher(message, shift)
  message_array = message.chars
  message_array = message_array.map do |char|
    is_character = only_letters?(char)
    if is_character
      shift_letter(char, shift)
    else
      char
    end
  end
  message_array.join
end