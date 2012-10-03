require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typechecker.rb')

describe TypeChecker, "#is_integer" do

  it "should be true for an Integer" do
    TypeChecker.new.is_integer?("1").should eq(true)
  end

  it "should be false for a string" do
    TypeChecker.new.is_integer?("a string").should eq(false)
  end

  it "should be false for a space" do
    TypeChecker.new.is_integer?(" ").should eq(false)
  end

  it "should be false for a float" do
    TypeChecker.new.is_integer?("1.0").should eq(false)
  end

end