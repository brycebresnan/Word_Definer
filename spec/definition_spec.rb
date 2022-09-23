require 'rspec'
require 'word'
require 'definition'

describe '#Definition' do
  before(:each) do
    @word = Word.new(word: "Defenestrate", id: nil)
    @word.save

    @attributes = {
      id: nil,
      def: "To throw out of a window.",
      word_id: @word.id
    }

    @def = Definition.new(@attributes)
  end
  
  describe('.list') do
    it("returns an array of the definition saved in the hash. Will return empty array if nothing is stored.") do
      expect(Definition.list).to(eq([]))
    end
  end

end