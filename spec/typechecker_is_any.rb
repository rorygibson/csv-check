require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typechecker.rb')

describe TypeChecker, "#is_string" do

  it "should allow a float" do
    TypeChecker.new.is_any?("1.0").should eq(true)
  end

  it "should allow an integer" do
    TypeChecker.new.is_any?("1").should eq(true)
  end

  it "should allow a string" do
    TypeChecker.new.is_any?("x").should eq(true)
  end

  it "should allow a space" do
    TypeChecker.new.is_any?(" ").should eq(true)
  end

  it "should not allow a nil" do
    TypeChecker.new.is_any?(nil).should eq(false)
  end

end