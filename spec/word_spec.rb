require 'rspec'
require 'word'
require 'definition'

describe '#Word' do

  before(:each) do
    Definition.delete_all
    Word.delete_all
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

  describe('#delete') do
    it("deletes a specific word from the hash") do
      @word.delete
      expect(Word.list).to(eq([]))
    end
  end

  describe('.sorted_list') do
    it('returns the array of values alphabetically') do
      word2 = Word.new(@attributes2)
      word2.save()
      word3 = Word.new(word: "Ambler", id: nil)
      word3.save()
      expect(Word.sorted_list).to(eq([word3,@word,word2]))
    end
  end

  describe('.find') do
    it('finds a specific word given the id') do
      expect(Word.find(@word.id)).to(eq(@word))
    end
  end

  describe('#definitions') do
    it('returns an array of all the definitions linked to this word') do
      definition = Definition.new(id: nil, definition: "To throw out of a window.",word_id: @word.id)
      definition.save()
      expect(@word.definitions).to(eq([definition]))
    end
  end

  describe('#delete_defs') do
    it('will delete all definitions assocatiated with this word') do
      definition = Definition.new(id: nil, definition: "To throw out of a window.",word_id: @word.id)
      definition.save()
      @word.delete_defs
      expect(@word.definitions).to(eq([]))
    end
  end

end