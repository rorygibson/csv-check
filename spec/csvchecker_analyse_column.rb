require 'csvchecker'

describe CsvChecker, "#analyse_column" do

  it "should raise an error for an unknown type" do
    expect { CsvChecker.analyse_column([1,2,3,4], 0, 'SOMETHING_ELSE')}.to raise_error
  end

  it "should raise an error for a nil index" do
    expect { CsvChecker.analyse_column([1,2,3,4], nil, 'integer')}.to raise_error
  end

  it "should raise an error for a negative index" do
    expect { CsvChecker.analyse_column([1,2,3,4], -1, 'integer')}.to raise_error
  end

  it "should raise an error for a nil row" do
    expect { CsvChecker.analyse_column(nil, 0, 'integer')}.to raise_error
  end

  it "should raise an error for an empty row" do
    expect { CsvChecker.analyse_column([], 0, 'integer')}.to raise_error
  end

  it "should pass when an integer is found" do
    CsvChecker.analyse_column([1,2,3,4], 0, 'integer').should eq(true)
  end

  it "should allow types to be specific case-insensitively" do
    CsvChecker.analyse_column([1,2,3,4], 0, 'InTeGeR').should eq(true)
  end

end