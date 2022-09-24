require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do 
  @words = Word.list
  erb(:words)
end

get('/words/new') do
  erb(:words_new)
end

post('/words') do
  new_word = params[:word]
  word = Word.new(word: new_word, id: nil)
  word.save()
  redirect to('/')
end