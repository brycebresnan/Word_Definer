require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do

    attributes = {
      word: "Cantankerous",
      id: nil
    }

    word = Word.new(attributes)
  end

  describe('.list') do
    it("returns an array of the words saved in the hash. Will return empty array if nothing is stored.") do
      expect(Word.list).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word to the class varriable hash") do
      expect(Word.list).to(eq([word]))
    end
  end

end