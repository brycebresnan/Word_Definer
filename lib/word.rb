class Word
  attr_reader :id
  attr_accessor :word

  @@words = {}
  @@unique_id = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @id = attributes.fetch(:id) || @@unique_id =+ 1
  end

  def self.list
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(word: self.word, id: self.id)
  end

  def ==(words_to_compare)
    self.word == words_to_compare.word
  end

  def self.delete_all
    @@words = {}
    @@unique_id = 0
  end

  def update(new_word)
    self.word = new_word
    @@words[self.id] = Word.new(word: self.word, id: self.id)
  end
end
