require  File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib', 'typechecker.rb')

describe TypeChecker, "#misc" do

  it "should be false for nil" do
    TypeChecker.new.is_nil?(nil).should eq(true)
  end

end