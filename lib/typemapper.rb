class TypeMapper 

	def to_map str
		raise 'Nil map string' unless str
		raise 'Empty map string' if str.length == 0

		map = Hash.new
		str.split(",").each {|pair|
			split_pair = pair.split(":", 2)
			k = split_pair[0]
			v = split_pair[1]
			map[k] = v
		}
		map
	end

end