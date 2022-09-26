require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create then get a word path', {:type => :feature}) do
  it('creates an word and then goes to the words page') do
    visit('/')
    click_on('ADD a new word!')
    fill_in('word', :with => 'Discus')
    click_on('Add Word!')
    expect(page).to have_content('Discus')
  end
end

describe('update a word path', {:type => :feature}) do
  it('updates a word and then goes to the word page') do
    Word.delete_all
    word = Word.new(word: 'Discus', id: nil)
    word.save
    visit("/word/#{word.id}")
    click_on('Edit')
    fill_in('word_edit', :with => 'Finicky')
    click_on('Update')
    expect(page).to have_content('Finicky')
  end
end

describe('delete a word path', {:type => :feature}) do
  it('deletes a word and then goes to the word page') do
    Word.delete_all
    word = Word.new(word: 'Discus', id: nil)
    word.save
    visit("/word/#{word.id}")
    click_on('Edit')
    click_on('Delete word')
    expect(page).to have_no_content('Discus')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and then goes to the word page') do
    Word.delete_all
    Definition.delete_all
    word = Word.new(word: 'Discus', id: nil)
    word.save
    visit("/word/#{word.id}")
    fill_in('definition_text', :with => 'A circular flat disc used for a throwing sport')
    click_on('Add Definition!')
    expect(page).to have_content('A circular flat disc used for a throwing sport')
  end
end

describe('update a definition path', {:type => :feature}) do
  it('deletes a word and then goes to the word page') do
    Word.delete_all
    word = Word.new(word: 'Discus', id: nil)
    word.save
    visit("/word/#{word.id}")
    click_on('Edit')
    click_on('Delete word')
    expect(page).to have_no_content('Discus')
  end
end