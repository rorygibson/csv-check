@string
Feature: Checking that a column can contain only string values

  Scenario: Check for presence of string in a column - successful - one row
    Given a file named "test.csv" with:
    """
    a,b,c,d
    w,x,y,z
    """
    When I run `csv-check -k --map "0:string" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0


  Scenario: Check for presence of string in a column - failure - one row
    Given a file named "test.csv" with:
    """
    a,b,c,d
    w,x,1,z
    """
    When I run `csv-check -k --map "2:string" test.csv`
    Then the output should contain "Found 1 errors"   
    And the exit status should be 1


  Scenario: Check for presence of string in a column - multiple rows and mapping elements
    Given a file named "test.csv" with:
    """
    a,b,c,d
    e,f,g,h
    i,j,k,l
    m,n,o,p
    """
    When I run `csv-check -k --map "0:string,1:string,2:string,3:string" test.csv`
    Then the output should contain "Found 0 errors"   
    And the exit status should be 0
