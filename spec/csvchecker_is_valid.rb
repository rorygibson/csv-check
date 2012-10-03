require 'csvchecker'

describe CsvChecker, "#is_valid" do

  it "should raise an error for an unknown type" do
    expect { CsvChecker.is_valid(1, 'SOMETHING_ELSE')}.to raise_error
  end

  it "should raise an error for a nil cell" do
    expect { CsvChecker.is_valid(nil, 'integer')}.to raise_error
  end

  it "should raise an error for an empty row" do
    expect { CsvChecker.is_valid("", 'integer')}.to raise_error
  end

  it "should pass when an integer is found" do
    CsvChecker.is_valid(1, 'integer').should eq(true)
  end

  it "should allow types to be specific case-insensitively" do
    CsvChecker.is_valid(1, 'InTeGeR').should eq(true)
  end

  it "should allow cells to have spaces at the end" do
    CsvChecker.is_valid("1 ", 'integer').should eq(true)
  end

  it "should allow cells to have spaces at the start" do
    CsvChecker.is_valid(" 1 ", 'integer').should eq(true)
  end

end