@unimplemented
Feature: Checking that a column can contain only integer values

  Scenario: Check for presence of integer in a column - successful - one row
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,3,4 
  	"""
    When I run `csv-check --map "c:integer" test.csv`
    Then the output should contain "Column [c] contains only integers - true"
    And the exit status should be 0


  Scenario: Check for presence of integer in a column - successful - multiple rows
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,3,4 
  	5,6,7,8
  	"""
    When I run `csv-check --map "c:integer" test.csv`
    Then the output should contain "Column [c] contains only integers - true"    
    And the exit status should be 0


  Scenario: Check for presence of integer in a column - failure - one row
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,x,4 
  	"""
    When I run `csv-check --map "c:integer" test.csv`
    Then the output should contain "Column [c] contains only integers - false"   
    And the exit status should be 1


  Scenario: Check for presence of integer in a column - failure - multiple rows
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,3,4 
  	5,6,7,8 
  	4,x,2,1 
  	"""
    When I run `csv-check --map "b:integer" test.csv`
    Then the output should contain "Column [b] contains only integers - false"   
    And the exit status should be 1    