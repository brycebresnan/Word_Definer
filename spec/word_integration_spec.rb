require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the words page') do
    visit('/')
    click_on('ADD a new word!')
    fill_in('word', :with => 'Discus')
    click_on('Add Word!')
    expect(page).to have_content('Discus')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and then goes to the word page') do
    word = Word.new(word: 'Discus', id: nil)
    word.save
    visit("/word/#{word.id}")
    fill_in('definition_text', :with => 'A circular flat disc used for a throwing sport')
    click_on('Add Definition!')
    expect(page).to have_content('A circular flat disc used for a throwing sport')
  end
end
