require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Array do
  def enable
    code = File.read(File.join(File.dirname(__FILE__), '/../lib/optionize/array.rb')){}
    eval(code)
  end

  def disable
    Array.send(:remove_method, :optionize) rescue nil
  end

  it "should not provide #optionize" do
    disable
    [].should_not respond_to(:optionize)
  end

  it "should provide #optionize when required" do
    enable
    [].should respond_to(:optionize)
  end

  describe "#optionize" do
    before  { enable }
    subject { ['maiha'].optionize(:name) }
    its(:class) { should == Optionize }
    its(:name)  { should == 'maiha' }
  end
end
