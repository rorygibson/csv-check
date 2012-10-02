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
            
            row.each_index { |i| 
            }          
        end

        print "Total number of lines checked: #{lines_scanned}\n"
        print "\n"
	end

    module_function :check
end
