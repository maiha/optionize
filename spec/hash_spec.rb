require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Optionize do
  it "should be merged by hash" do
    hash = {:a=>1}

    opt = Optionize.new([])
    opt[:b] = 2
    hash.merge(opt).should == {:a=>1, "b"=>2}
  end
end
