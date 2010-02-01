require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Optionize do
  describe ".new" do
    it "should raise ArgumentError when no args given" do
      lambda {
        Optionize.new
      }.should raise_error(ArgumentError)
    end

    it "should accept array" do
      lambda {
        Optionize.new([])
      }.should_not raise_error(ArgumentError)
    end
  end

  describe ".new(['maiha',14], :name, :age)" do
    subject { Optionize.new(['maiha',14], :name, :age) }

    ######################################################################
    ### Mash access

    its(:[], "name") { should == 'maiha' }
    its(:[], :name ) { should == 'maiha' }

    its(:[], "age" ) { should == 14 }
    its(:[], :age  ) { should == 14 }

    ######################################################################
    ### Named access

    its(:name) { should == 'maiha' }
    its(:age ) { should == 14 }
    
    its(:no_such_method) { should == nil }

    ######################################################################
    ### Given names

    its (:names) { should == ['name', 'age'] } # should be strings
  end


  ######################################################################
  ### Mash for runtime values

  describe ".new([{:name=>'maiha'}], :name, :age)" do
    subject { Optionize.new([{:name=>'maiha'}], :name, :age) }
    its(:name) { should == 'maiha' }
  end

  describe ".new([{'name'=>'maiha'}], :name, :age)" do
    subject { Optionize.new([{'name'=>'maiha'}], :name, :age) }
    its(:name) { should == 'maiha' }
  end

  describe ".new([{:name=>'maiha'}], 'name', 'age')" do
    subject { Optionize.new([{:name=>'maiha'}], 'name', 'age') }
    its(:name) { should == 'maiha' }
  end

  ######################################################################
  ### Hash and Array for given values

  describe ".new(['maiha', {:age=>14}], :name, :age)" do
    subject { Optionize.new(['maiha', {:age=>14}], :name, :age) }
    its(:name ) { should == 'maiha' }
    its("name") { should == 'maiha' }
    its(:age  ) { should == 14 }
    its("age" ) { should == 14 }
  end

  ######################################################################
  ### Default values

  describe ".new([], :name, :age, {:name=>'maiha'})" do
    subject { Optionize.new([], :name, :age, {:name=>'maiha'}) }
    its(:name ) { should == 'maiha' }
    its("name") { should == 'maiha' }
  end

  ######################################################################
  ### Overwrite default values

  describe ".new(['nksk'], :name, :age, {:name=>'maiha'})" do
    subject { Optionize.new(['nksk'], :name, :age, {:name=>'maiha'}) }
    its(:name ) { should == 'nksk' }
    its("name") { should == 'nksk' }
    its(:age  ) { should == nil }
    its("age" ) { should == nil }
  end

  describe ".new([:age=>16], :name, :age, {:name=>'maiha'})" do
    subject { Optionize.new([:age=>16], :name, :age, {:name=>'maiha'}) }
    its(:name ) { should == 'maiha' }
    its("name") { should == 'maiha' }
    its(:age  ) { should == 16 }
    its("age" ) { should == 16 }
  end

end
