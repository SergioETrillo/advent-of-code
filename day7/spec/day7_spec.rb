require 'day7'

describe Day7 do
  subject(:d7) { described_class.new }
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
      expect(d7.lines.count).to eq 339
    end

    it "check last line of the file's content" do
      expect(d7.lines[-1]).to eq @result
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
      expect(d7.reverse(@line)).to eq @reverse
    end

    it "reverses file" do
      expect(d7.reverse_data[-1]).to eq @rev_last_line
    end

    it "sorts file by first element" do
      d7.reverse_data
      expect(d7.sort_file[0]).to eq @first_sorted_item
    end

    it "trims properly the file" do
      d7.reverse_data
      d7.trim
      expect(d7.lines[-1]).to eq ["hh", "he RSHIFT 5"]
    end

    it "converts to hash" do
      d7.reverse_data
      d7.convert_to_hash
      expect(d7.lines).to be_instance_of(Hash)
      expect(d7.lines.first).to eq [" ls", "lf AND lq "]
    end


  end
end