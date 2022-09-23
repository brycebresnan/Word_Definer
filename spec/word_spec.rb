require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do

    @attributes = {
      word: "Cantankerous",
      id: nil
    }

    @attributes2 = {
      word: "Dirigible",
      id: nil
    }

    @word = Word.new(@attributes)
    @word.save

  end

  describe('.list') do
    it("returns an array of the words saved in the hash. Will return empty array if nothing is stored.") do
      expect(Word.list).to(eq([@word]))
    end
  end

  describe('#==') do
    it("allows test to compare two of the same words ") do
      word = Word.new(word: "Cantankerous", id: nil)
      word.save 
      word2 = Word.new(word: "Cantankerous", id: nil)
      word2.save
      expect(word).to(eq(word2))
    end
  end

  describe('#save') do
    it("saves a word to the class varriable hash") do
      expect(Word.list).to(eq([@word]))
    end
  end

  describe('.delete_all') do
    it("Clears all words out of the hash") do
      Word.delete_all
      expect(Word.list).to(eq([]))
    end
  end

  describe('#update') do
    it("updates a word but keeps it's id") do
      @word.update("Blimp")
      expect(@word.word).to(eq("Blimp"))
    end
  end

end