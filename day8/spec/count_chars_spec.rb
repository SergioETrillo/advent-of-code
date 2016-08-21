require 'count_chars'

describe CountChars do
  let(:countchars) { described_class.new}

  it "instantiates object" do
    countchars.calc()
  end

end