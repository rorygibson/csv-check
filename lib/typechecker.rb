class TypeChecker
	
    def is_integer?(str)
      str = str.to_s

      [                          # In descending order of likelihood:
        /^[-+]?[1-9]([0-9]*)?$/, # decimal
        /^0[0-7]+$/,             # octal
        /^0x[0-9A-Fa-f]+$/,      # hexadecimal
        /^0b[01]+$/              # binary
      ].each do |match_pattern|
        return true if str =~ match_pattern
      end

      return false
    end

end