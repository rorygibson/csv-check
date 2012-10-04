@integer
Feature: Should work the same regardless of number of rows

  Scenario: Works for header + one row
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,3,4
  	"""
    When I run `csv-check -k --map "0:integer" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0

  Scenario: Works for header + many rows
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