require 'logic_calculator'

describe "Integration Test" do
  subject(:logic_calculator) { LogicCalculator.new }
  before(:each) do
    @file_challenge1  = File.read("lib/input.txt")
    @file_challenge2 = File.read("lib/input2.txt")
    @RESULT1 = 16076
    @RESULT2 = 2797
  end

  it "calculates the right signal for challenge 1" do
    lines = @file_challenge1.split("\n")
    logic_calculator.reverse_data
    logic_calculator.sort_file
    logic_calculator.trim
    logic_calculator.convert_to_hash
    expect(logic_calculator.process_signals).to eq @RESULT1
  end

  it "calculates the right signal for challenge 2" do
    lines = @file_challenge2.split("\n")
    logic_calculator.reverse_data
    logic_calculator.sort_file
    logic_calculator.trim
    logic_calculator.convert_to_hash
    expect(logic_calculator.process_signals).to eq @RESULT1
  end
end