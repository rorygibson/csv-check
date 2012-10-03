Feature: Checking that a column can contain only integer values

  Scenario: Check for presence of integer in a column - successful - one row
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,3,4
  	"""
    When I run `csv-check -k --map "0:integer" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0

  Scenario: Check for presence of integer in a column - successful - multiple rows
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,3,4
  	5,6,7,8
    """
    When I run `csv-check -k --map "0:integer" test.csv`
    Then the output should contain "Found 0 errors"    
    And the exit status should be 0

  Scenario: Check for presence of integer in a column - failure - one row
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,x,4
  	"""
    When I run `csv-check -k --map "2:integer" test.csv`
    Then the output should contain "Found 1 errors"   
    And the exit status should be 1

  Scenario: Check for presence of integer in a column - failure - multiple rows
    Given a file named "test.csv" with:
    """
    a,b,c,d
    1,2,3,4
    5,6,7,8
    4,x,2,1
    """
    When I run `csv-check -k --map "1:integer" test.csv`
    Then the output should contain "Found 1 errors"   
    And the exit status should be 1    

  Scenario: Check for presence of integer in a column - failure - multiple rows and failures
    Given a file named "test.csv" with:
    """
    a,b,c,d
    1,2,3,4
    5,6,x,8
    4,x,2,1
    """
    When I run `csv-check -k --map "1:integer,2:integer" test.csv`
    Then the output should contain "Found 2 errors"   
    And the exit status should be 1    

  Scenario: Check for presence of integer in a column - multiple rows and mapping elements
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