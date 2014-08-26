require "spec_helper"

#keep getting this error in terminal when running rspec:  uninitialized constant Calculator (NameError)

describe Calculator do

  it "takes an empty string" do
    expect(Calculator.add(" ")).to eq(0)
  end

  it "takes one number" do
    expect(Calculator.add("8")).to eq("8")
   end

  it "adds two numbers" do
    expect(Calculator.add("1,2")).to eq("3")
   end
   
  it "takes numbers separated by new lines" do
    expect(Calculator.add("1\n2,3")).to eq("6")
     end

     #Use the raise_error matcher to specify that a block of code raises an error. 
  it "should raise an error when a negative number is entered" do
    expect(Calculator.add("1,-8")).to raise_exception
  end
       
   it "should show input when passed negative numbers" do
    expect(Calculator.add("-2,-8")).to raise_exception "Negatives not allowed: -2 & -8"
   end
  end
 