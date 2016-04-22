require 'rails_helper'

RSpec.describe Snippet, type: :model do

  describe "validations" do

    it "requires a title" do
      s = Snippet.new(title: "", work: "some text here")
      expect(s).to be_invalid
    end

    it "requires work" do
      s = Snippet.new(title: "Ruby", work: "")
      expect(s).to be_invalid
    end
  end

end
