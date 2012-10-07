require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typemapper.rb')

describe TypeMapper, "#to_map" do

  it "should create the map" do
    TypeMapper.new.to_map("0:integer,1:string").should == {"1"=>"string", "0"=>"integer"}
  end

  it "should raise error for a nil string" do
    expect { TypeMapper.new.to_map(nil) }.to raise_error
  end

  it "should raise error for an empty string" do
    expect { TypeMapper.new.to_map("") }.to raise_error
  end

  it "should allow type names with colons in (for date format)" do
  	TypeMapper.new.to_map("0:integer,1:date('%d/%m/%Y %H:%M')").should == { "0"=>"integer", "1"=>"date('%d/%m/%Y %H:%M')" }	
  end

end