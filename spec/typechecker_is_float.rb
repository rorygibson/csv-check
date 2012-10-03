require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typechecker.rb')

describe TypeChecker, "#is_string" do

  it "should allow a negative float" do
    TypeChecker.new.is_float?("-1.0").should eq(true)
  end

  it "should allow a positive signed float" do
    TypeChecker.new.is_float?("+1.0").should eq(true)
  end

  it "should allow a zero-padded float" do
    TypeChecker.new.is_float?("001.0").should eq(true)
  end

  it "should allow more than one digit after the decimal point" do
    TypeChecker.new.is_float?("2.000").should eq(true)
  end

  it "should require numbers after the decimal point" do
    TypeChecker.new.is_float?("1.").should eq(false)
  end

  it "should not require numbers before the decimal point" do
    TypeChecker.new.is_float?(".22").should eq(true)
  end

end