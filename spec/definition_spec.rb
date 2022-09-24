require 'rspec'
require 'word'
require 'definition'

describe '#Definition' do
  
  before(:each) do
    Definition.delete_all
    Word.delete_all
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
      definition = Definition.new(id: nil, definition: "To throw out of a window.",word_id: @word.id)
      definition.save 
      Definition.delete_all
      expect(Definition.list).to(eq([]))
    end
  end

  describe('#update') do
    it("updates a definition but keeps it's id") do
      definition = Definition.new(@attributes)
      definition.save 
      definition.update("The act of finding a penny on the ground.")
      expect(definition.definition).to(eq("The act of finding a penny on the ground."))
    end
  end

  describe('#delete') do
    it("deletes a specific definition from the hash") do
      definition = Definition.new(@attributes)
      definition.save
      definition.delete
      expect(Definition.list).to(eq([]))
    end
  end

  describe('self.find') do
    it('finds a specific definition given the id') do
      definition = Definition.new(@attributes)
      definition.save
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('.find_by_word') do
    it("finds definition for a word given the word's id") do
      word2 = Word.new(word: "Goober", id: nil)
      word2.save
      definition = Definition.new(@attributes)
      definition.save
      definition2 = Definition.new(id: nil, definition: "To throw out of a window.",word_id: word2.id)
      definition2.save 
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('.delete_by_id') do
    it('will delete any definition with the given id') do
      definition = Definition.new(@attributes)
      definition.save
      definition2 = Definition.new(id: nil, definition: "To throw out of a window.",word_id: @word.id)
      definition2.save
      Definition.delete_by_id(definition2.id)
      expect(Definition.list).to(eq([definition]))
    end
  end

end