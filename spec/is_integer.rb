require 'csv-check'

describe CsvCheck, "#is_integer" do

  it "should be true for an Integer" do
    CsvCheck.is_integer?("1").should eq(true)
  end

  it "should be false for a string" do
    CsvCheck.is_integer?("a string").should eq(false)
  end

  it "should be false for a space" do
    CsvCheck.is_integer?(" ").should eq(false)
  end

  it "should be false for a float" do
    CsvCheck.is_integer?("1.0").should eq(false)
  end

end