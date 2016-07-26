require 'day7'

describe Day7 do
  subject(:d7) { Day7.new }
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
      expect(d7.get_raw_data.count).to eq 339
    end

    it "check last line of the file's content" do
      expect(d7.get_raw_data[-1]).to eq @result
    end
  end

  context "input processing" do
    before do
      @line = "lf AND lq -> ls"
      @reverse = [" ls", "lf AND lq "]
    end

    it "reverses one line" do
      expect(d7.reverse(@line)).to eq @reverse
    end

    it "reverses file" do

    end
  end
end