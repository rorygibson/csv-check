class TypeChecker
	
    def is_integer?(str)
      str = str.to_s
      str.strip!

      match_pattern = /^[-+]?[0-9][0-9]*?$/
      return !str.match(match_pattern).nil?
    end

    def is_float?(str)
      str = str.to_s
      str.strip!

      match_pattern = /^[-+]?[0-9]*\.[0-9]+?$/
      return !str.match(match_pattern).nil?
    end

    def is_date?(data, format)
      parsed = DateTime.parse(data)
      output = parsed.strftime(format)
      matches = (output == data)

      return matches
    end

    def is_space?(thing)
      return thing.to_s == " "
    end

    def is_nil?(thing) 
      return thing.nil?
    end

    def is_string?(thing) 
      return false if is_nil?(thing)      
      return false if is_integer?(thing) 
      return false if is_float?(thing)
      return true if is_space?(thing)
      true if thing.is_a? String
    end

    def is_any?(thing) 
      return false if is_nil?(thing)      
      return true if is_integer?(thing) 
      return true if is_float?(thing)
      return true if is_space?(thing)
      true if thing.is_a? String
    end

end