class TypeChecker
	
    def is_integer?(str)
      str = str.to_s
      str.strip!

      match_pattern = /^[-+]?[0-9][0-9]*?$/
      return !str.match(match_pattern).nil?
    end

    def is_float?(str)
      str = str
      str.to_s.strip!
      
      match_pattern = /^[-+]?[0-9]*\.[0-9]+?$/
      return !str.match(match_pattern).nil?
    end

    def is_empty_string?(thing)
      return thing.to_s == " "
    end

    def is_nil?(thing) 
      return thing.nil?
    end

    def is_string?(thing) 
      return false if is_nil?(thing)      
      return false if is_integer?(thing) 
      return false if is_float?(thing)
      return true if is_empty_string?(thing)
      true if thing.is_a? String
    end

end