require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typechecker.rb')

describe TypeChecker, "#is_date" do

  it "should allow a date that matches the date format" do
    TypeChecker.new.is_date?("01/01/2012", "%d/%m/%Y").should eq(true)
  end

  it "should work with custom formats" do
    TypeChecker.new.is_date?("01-01-2012", "%d/%m/%Y").should eq(false)
  end

  it "should allow timestamps if used with custom format" do
    TypeChecker.new.is_date?("01-01-2012 12:50", "%d-%m-%Y %H:%M").should eq(true)
  end

end