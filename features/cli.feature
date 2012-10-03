Feature: Skip first row
  In order to work with files with or without headers
  As a CLI
  I want to be able to skip the first row of input

  Scenario: Skip first row
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,3,4 
  	"""
    When I run `csv-check -k test.csv`
    Then the output should contain "Total number of lines checked: 1"

  Scenario: Don't skip first row  
  	Given a file named "test.csv" with:
  	"""
  	a,b,c,d
  	1,2,3,4 
  	"""
    When I run `csv-check test.csv`
    Then the output should contain "Total number of lines checked: 2"