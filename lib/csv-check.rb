require 'rubygems'
require 'fastercsv'

module CsvCheck
	def check input, output, mappings={}, csv_options={}, skip_first=false
		if input.is_a? File
			path = File.expand_path(input.path)
			print "CsvCheck checking #{path}\n"
		else
			print "CsvCheck checking std in\n"
		end

		line_no = 1
		lines_scanned = 0

        FasterCSV.new(input, csv_options).each do |row|
            if skip_first then
            	line_no = line_no + 1
            	skip_first = false
                next
            end

			lines_scanned = lines_scanned + 1 
            
            check_against_mapping(row, mappings)
        end

        print "Total number of lines checked: #{lines_scanned}\n"
        print "\n"
	end


    def check_against_mapping row, mappings
        row.each_index { |i|
            if mappings[i] then
                print "Checking col #{i}\n"
            end
        }
    end


    def analyse_column row, index, type
        raise 'Nil row' unless row
        raise 'Empty row' unless row.size > 0
        raise 'Nil index' unless index
        raise 'Negative index' unless index >= 0

        type.downcase!
        cell = row[index]

        case type
        when 'integer'
            true if is_integer?(cell)
        else
            raise 'Unrecognised column type'
        end

        return false
    end

    def is_integer?(str)
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

    module_function :check
    module_function :analyse_column
    module_function :is_integer?
    module_function :check_against_mapping
end
