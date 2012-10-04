@any
Feature: Checking that a column can contain any type of value

  Scenario: Any can substiture for integer
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,3,4
  	"""
    When I run `csv-check -k --map "0:any" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0


  Scenario: Any can substiture for float
    Given a file named "test.csv" with:
    """
    a,b,c,d
    1.0, 2, 3, 4
    """
    When I run `csv-check -k --map "0:any" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0


  Scenario: Any can substiture for string
    Given a file named "test.csv" with:
    """
    a,b,c,d
    x, 2, 3, 4
    """
    When I run `csv-check -k --map "0:any" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0


  Scenario: Any doesn't substitute for nil
    Given a file named "test.csv" with:
    """
    a,b,c,d
    , 2, 3, 4
    """
    When I run `csv-check -k --map "0:any" test.csv`
    Then the output should contain "Found 1 errors"
    And the exit status should be 1


