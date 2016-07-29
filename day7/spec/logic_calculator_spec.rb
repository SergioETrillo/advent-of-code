require 'logic_calculator'

describe LogicCalculator do
  subject(:logic_calculator) { described_class.new }
  before(:each) do
    @f = File.read("lib/input.txt")
    @lines = @f.split("\n")
  end

  context "File management" do
    before do
      @result = "he RSHIFT 5 -> hh"
    end

    it "reads the file and gets some raw data" do
      expect(@f).not_to be_nil
    end

    it "splits file in lines" do
      expect(logic_calculator.lines.count).to eq 339
    end

    it "check last line of the file's content" do
      expect(logic_calculator.lines[-1]).to eq @result
    end
  end

  context "input processing" do
    before do
      @line = "lf AND lq -> ls"
      @reverse = [" ls", "lf AND lq "]
      @rev_last_line = [" hh", "he RSHIFT 5 "]
      @first_sorted_item = [" a", "lx "]
    end

    it "reverses one line" do
      expect(logic_calculator.reverse(@line)).to eq @reverse
    end

    it "reverses file" do
      expect(logic_calculator.reverse_data[-1]).to eq @rev_last_line
    end

    it "sorts file by first element" do
      logic_calculator.reverse_data
      expect(logic_calculator.sort_file[0]).to eq @first_sorted_item
    end

    it "trims properly the file" do
      logic_calculator.reverse_data
      logic_calculator.trim
      expect(logic_calculator.lines[-1]).to eq ["hh", "he RSHIFT 5"]
    end

    it "converts to hash" do
      logic_calculator.reverse_data
      logic_calculator.convert_to_hash
      expect(logic_calculator.lines).to be_instance_of(Hash)
      expect(logic_calculator.lines.first).to eq [" ls", "lf AND lq "]
    end
  end

  context "processing operations" do
    before do
      logic_calculator.reverse_data
      logic_calculator.sort_file
      logic_calculator.trim
      logic_calculator.convert_to_hash

    end

    it "differentiates between nums and strings" do
      expect(logic_calculator.select_value("1")).to eq 1
      expect(logic_calculator.select_value(logic_calculator.lines.first[0])).to eq logic_calculator.lines.first[1]
    end

    it "provides right operand values" do
      lv_val, lm_val, io_val = logic_calculator.lines["lv"], logic_calculator.lines["lm"], logic_calculator.lines["io"]
      entry1 = ["lv","LSHIFT","15"]
      entry2 = ["1","AND","io"]
      entry3 = ["lm","OR","lv"]
      expect(logic_calculator.provide_ops_values(entry1)).to eq [lv_val, "LSHIFT", 15]
      expect(logic_calculator.provide_ops_values(entry2)).to eq [1, "AND", io_val]
      expect(logic_calculator.provide_ops_values(entry3)).to eq [lm_val, "OR", lv_val]
    end

    it "makes the binary operations" do
      x = 123
      y = 456
      expect(logic_calculator.calc_logic(x,"AND",y)).to eq 72
      expect(logic_calculator.calc_logic(x,"OR",y)).to eq 507
      expect(logic_calculator.calc_logic(x,"LSHIFT",2)).to eq 492
      expect(logic_calculator.calc_logic(y,"RSHIFT",2)).to eq 114
    end

    it "calculates NOT operations" do
      x = 123
      not_x = 65412
      ary = ["NOT", "b"]
      expect(logic_calculator._not(x)).to eq not_x
    end
  end
end