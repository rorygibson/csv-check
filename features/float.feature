@float
Feature: Checking that a column can contain only float values

  Scenario: Check for presence of float in a column - successful - one row
    Given a file named "test.csv" with:
    """
    a,b,c,d
    1.0, 2, 3, 4
    """
    When I run `csv-check -k --map "0:float" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0

  Scenario: Check for presence of float in a column - failure - one row
    Given a file named "test.csv" with:
    """
    a,b,c,d
    1.0, 2.0, x, 4.0
    """
    When I run `csv-check -k --map "2:float" test.csv`
    Then the output should contain "Found 1 errors"   
    And the exit status should be 1

  Scenario: Check for presence of float in a column - multiple rows and mapping elements
    Given a file named "test.csv" with:
    """
    a,b,c,d
    1.0, 2.0, 3.0, 4.0
    5.0, 6.0, 7.0, 8.0
    4.0, 3.0, 2.0, 1.0
    """
    When I run `csv-check -k --map "0:float,1:float,2:float,3:float" test.csv`
    Then the output should contain "Found 0 errors"   
    And the exit status should be 0
