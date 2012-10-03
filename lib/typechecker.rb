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

    def is_empty_string?(thing)
      false if thing.to_s == " "
    end

    def is_nil?(thing) 
      false if thing.nil?
    end

    def is_string?(thing) 
      return false if is_nil?(thing)
      return false if is_empty_string?(thing)
      return false if is_integer?(thing)
      true if thing.is_a? String
    end

end