@date
Feature: Checking that a column can contain only date values

  Scenario: Check for presence of date in a column - successful - one row
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	01/01/1980,2,3,4
  	"""
    When I run `csv-check -k --map "0:date" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0


  Scenario: Specifying date format - success
    Given a file named "test.csv" with:
    """
    a,b,c,d
    01/01/1980 12:50,2,3,4
    """
    When I run `csv-check -k --map "0:date('%d/%m/%Y %H:%M')" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0   


  Scenario: Specifying date format - failure
    Given a file named "test.csv" with:
    """
    a,b,c,d
    01/01/1980 12:50,2,3,4
    """
    When I run `csv-check -k --map "0:date('%d/%m/%Y')" test.csv`
    Then the output should contain "Found 1 errors"
    And the exit status should be 1    


  Scenario: Check for presence of date in a column - failure - one row
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,x,4
  	"""
    When I run `csv-check -k --map "2:date" test.csv`
    Then the output should contain "Found 1 errors"   
    And the exit status should be 1

