require 'rspec'
require 'word'

descibe '#Word' do

  before(:each) do

  attributes = {
    word: "Cantankerous"
    id: nil
  }

  end

  describe('.list') do
    it("returns an array of the words saved in the hash. Will return empty array if nothing is stored.") do
      expect(Word.list).to(eq([]))
    end
  end

end