require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'csvchecker.rb')

describe CsvChecker, "#dateFormatFrom" do

  it "should extract a simple format" do
  	CsvChecker.dateFormatFrom("date('%d-%m-%Y')").should eq("%d-%m-%Y")
  end

  it "should extract a timestamp format" do
  	CsvChecker.dateFormatFrom("date('%d-%m-%Y %H:%M')").should eq("%d-%m-%Y %H:%M")
  end

  it "should supply the default format if no format is supplied" do
  	CsvChecker.dateFormatFrom("date").should eq("%d/%m/%Y")
  end

end