require 'rubygems'
require 'fastercsv'
require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typechecker.rb')

module CsvChecker

    DEFAULT_DATE_FORMAT = "%d/%m/%Y"

	def check input, output, mappings={}, csv_options={}, skip_first=false
		line_no = 1
		lines_scanned = 0
        num_errors = 0

        i = 0
        FasterCSV.new(input, csv_options).each do |row|
            if skip_first then
            	line_no = line_no + 1
            	skip_first = false
                next
            end

			lines_scanned = lines_scanned + 1 
            
            num_errors = num_errors + check_row(i, row, mappings) unless row.empty?
            i = i + 1
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


    def check_row row_num, row, mappings
        raise "Nil mappings" if mappings.nil? 
        raise "Nil row" if row.nil?

        errors = 0
        i = 0
        row.each { |item|
            type = mappings[i.to_s]

            if type then
                puts "Checking [#{item}] against [#{type}]\n"
                valid = is_valid item, type
                if !valid then
                    print "Error at row #{row_num} column #{i}\n"
                    errors = errors + 1 
                end
            end

            i = i + 1
        } 

        return errors
    end


    def is_valid cell, type
        raise 'Nil type' unless type
        raise 'Empty type' unless type.size > 0

        type_selector = type.downcase
        type_selector = "date" if type.match /^date/ 

        case type_selector
        when 'integer'
            return TypeChecker.new.is_integer?(cell)

        when 'float'
            return TypeChecker.new.is_float?(cell)

        when 'string'
            return TypeChecker.new.is_string?(cell)

        when 'date'
            format = dateFormatFrom(type)
            return TypeChecker.new.is_date?(cell, format)

        when 'any'
            return TypeChecker.new.is_any?(cell)

        else
            raise "Unrecognised column type [#{type_selector}]"
        end
    end

    def dateFormatFrom str
        return DEFAULT_DATE_FORMAT if str == "date" 

        puts "[#{str}]\n"

        if str.match /^date.*/ then
            type = str[ /'(.*)'/ , 1 ]
            return type
        end

        return DEFAULT_DATE_FORMAT
    end

    module_function :check
    module_function :is_valid
    module_function :check_row
    module_function :dateFormatFrom
end
