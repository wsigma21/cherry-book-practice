# frozen_string_literal: true

def convert_hash_syntax(old_syntax)
  old_syntax.gsub(/:(\w+) *=> */) do
    "#{Regexp.last_match(1)}: "
  end
end

old_syntax = <<~TEXT
  {
    :name => 'Alice',
    :age=>20,
    :gender => :female
  }
TEXT

actual = convert_hash_syntax(old_syntax)
puts actual
