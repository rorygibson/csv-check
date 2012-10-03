require 'rubygems'
require 'fastercsv'
require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typechecker.rb')

module CsvChecker


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
            #print "line #{line_no}\n"
            
            check_against_mapping(row, mappings) unless row.empty?
        end

        print "Total number of lines checked: #{lines_scanned}\n"
        print "\n"
	end


    def check_against_mapping row, mappings
        return if mappings.nil? || row.nil?

        i = 0
        row.each { |item|
            type = mappings[i.to_s]

            if type then
                print "Checking col #{i} against type #{type}\n"
                raise "Error at col #{i}" unless analyse_column item, type
            end

            i = i + 1
        } 
    end


    def analyse_column cell, type
        raise 'Nil cell' unless cell
        raise 'Empty cell' unless cell.size > 0
        raise 'Nil type' unless type
        raise 'Empty type' unless type.size > 0

        type.downcase!

        case type
        when 'integer'
            return TypeChecker.new.is_integer?(cell)
        else
            raise 'Unrecognised column type'
        end
    end


    module_function :check
    module_function :analyse_column
    module_function :check_against_mapping
end
