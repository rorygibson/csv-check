require 'rubygems'
require 'fastercsv'
require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typechecker.rb')

module CsvChecker

	def check input, output, mappings={}, csv_options={}, skip_first=false
		line_no = 1
		lines_scanned = 0
        num_errors = 0

        FasterCSV.new(input, csv_options).each do |row|
            if skip_first then
            	line_no = line_no + 1
            	skip_first = false
                next
            end

			lines_scanned = lines_scanned + 1 
            
            num_errors = num_errors + check_row(row, mappings) unless row.empty?
        end

        print "Total number of lines checked: #{lines_scanned}\n"
        print "Found #{num_errors} errors"
        print "\n"

        if num_errors > 0 then
            exit 1
        else
            exit 0
        end
	end


    def check_row row, mappings
        raise "Nil mappings" if mappings.nil? 
        raise "Nil row" if row.nil?

        errors = 0
        i = 0
        row.each { |item|
            type = mappings[i.to_s]

            if type then
                valid = is_valid item, type
                errors = errors + 1 unless valid
            end

            i = i + 1
        } 

        return errors
    end


    def is_valid cell, type
        raise 'Nil cell' unless cell
        raise 'Empty cell' unless cell.size > 0
        raise 'Nil type' unless type
        raise 'Empty type' unless type.size > 0

        type.downcase!

        case type
        when 'integer'
            return TypeChecker.new.is_integer?(cell)
        when 'float'
            return TypeChecker.new.is_float?(cell)
        else
            raise 'Unrecognised column type'
        end
    end


    module_function :check
    module_function :is_valid
    module_function :check_row
end
