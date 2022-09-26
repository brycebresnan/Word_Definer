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


