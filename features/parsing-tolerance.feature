Feature: Parsing is tolerant of spaces in cells and at the end of lines

  Scenario: End of line has spaces
    Given a file named "test.csv" with:
    """
    a,b,c,d
    1,2,3,4   
    5,6,7,8    
    4,3,2,1 
    """
    When I run `csv-check -k --map "0:integer,1:integer,2:integer,3:integer" test.csv`
    Then the output should contain "Found 0 errors"   
    And the exit status should be 0  