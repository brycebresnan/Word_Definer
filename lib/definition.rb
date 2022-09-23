class Definition

  attr_reader :id
  attr_accessor :def, :word_id

  @@defs = {}
  @@unique_id = 0

  def initialize(attributes)
    @word_id = attributes.fetch(:word_id)
    @defs = attributes.fetch(:def)
    @id = attributes.fetch(:id)  || @@unique_id += 1
  end

  def self.list
    @@defs.values()
  end
end