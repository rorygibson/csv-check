@real
Feature: Test against a real example

  Scenario: Test against a real example, row is OK
    Given a file named "test.csv" with:
    """
    1359515,7102,129,11/09/2012 00:00,IP12 7QN,X21356,RM,16 Long Road,2000,200000,7831060
    1359524,7158,129,11/09/2012 00:00,E14 3NU,X22366,SS,57 Wide Road,34000,0,734820
    1359534,8073,136,11/09/2012 00:00,S11 3XX,X22373,DP,27 Sally Road,8000,85000,559974/1
    1359590,7073,240,11/09/2012 00:00,RM5 5UB,X22419,IL,9 Green Green,130000,144000,A6229012190-1
    1359647,6937,353,11/09/2012 00:00,GU4 0SN,X22474,S2,50 Owls'n'Blades Road,250000,250000,9455066180 040305
    1359670,20,301,11/09/2012 00:00,DN17 5AD,X22898,FA,19 Olive Oyl,200000,200000,70727669
    1359682,3228,6,11/09/2012 00:00,AB1 8FD,X22811,RM,7 Middleearth Crescent,225000,500000,9453390 036541705
    """
    When I run `csv-check -k --map "0:integer,1:integer,2:integer,3:string,4:string,5:string,6:string,7:string,8:integer,9:integer,10:any" test.csv`
    Then the output should contain "Found 0 errors"
    And the exit status should be 0


  Scenario: Test against a real example, row has errors
    Given a file named "test.csv" with:
    """
    6856,Mr,"Christie, Stephen",1985,0072613
    6857,Ms,"Parkes, Sirah",2001,0854757
    6859,Mr,"Dyce, John",Barr Brady,0096518
    """
    When I run `csv-check -k --map "0:integer,1:string,2:string,3:integer,4:integer" test.csv`
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
