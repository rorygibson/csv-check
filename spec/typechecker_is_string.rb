require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typechecker.rb')

describe TypeChecker, "#is_string" do

  it "should be true for a string" do
    TypeChecker.new.is_string?("some string").should eq(true)
  end

  it "should be false for an integer" do
    TypeChecker.new.is_string?("1").should eq(false)
  end

  it "should be true for a space" do
    TypeChecker.new.is_string?(" ").should eq(true)
  end

  it "should be false for a float" do
    TypeChecker.new.is_string?("1.0").should eq(false)
  end

end