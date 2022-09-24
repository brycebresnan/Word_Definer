class Definition

  attr_reader :id
  attr_accessor :definition, :word_id

  @@defs = {}
  @@unique_id = 0

  def initialize(attributes)
    @word_id = attributes.fetch(:word_id)
    @definition = attributes.fetch(:definition)
    @id = attributes.fetch(:id) || @@unique_id += 1
  end

  def self.list
    @@defs.values()
  end

  def save
    @@defs[self.id] = Definition.new(definition: self.definition, id: self.id, word_id: self.word_id)
  end

  def ==(words_to_compare)
    self.definition == words_to_compare.definition
  end

  def self.delete_all
    @@defs = {}
    @@unique_id = 0
  end

  def update(new_definition)
    self.definition = new_definition
    @@defs[self.id] = Definition.new(definition: self.definition, id: self.id, word_id: self.word_id)
  end

  def delete
    @@defs.delete(self.id)
  end

  def self.find(id)
    @@defs[id]
  end

  def self.find_by_word(search_word_id)
    definitions = []
    @@defs.values.each do |definition|
      if definition.word_id == search_word_id
        definitions.push(definition)
      end
    end
    definitions
  end

end