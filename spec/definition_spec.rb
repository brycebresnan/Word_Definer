require 'rspec'
require 'word'
require 'definition'

describe '#Definition' do
  before(:each) do
    @word = Word.new(word: "Defenestrate", id: nil)
    @word.save

    @attributes = {
      id: nil,
      definition: "To throw out of a window.",
      word_id: @word.id
    }

  end
  
  describe('.list') do
    it("returns an array of the definition saved in the hash. Will return empty array if nothing is stored.") do
      expect(Definition.list).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition to the class varriable hash") do
      definition = Definition.new(@attributes)
      definition.save()
      expect(Definition.list).to(eq([definition]))
    end
  end

  describe('#==') do
    it("allows test to compare two of the same words ") do
      definition = Definition.new(id: nil, definition: "To throw out of a window.",word_id: @word.id)
      definition.save 
      definition2 = Definition.new(id: nil, definition: "To throw out of a window.",word_id: @word.id)
      definition2.save 
      expect(definition).to(eq(definition2))
    end
  end

  describe('.delete_all') do
    it("Clears all definitions out of the hash") do
      Definition.delete_all
      expect(Definition.list).to(eq([]))
    end
  end

end