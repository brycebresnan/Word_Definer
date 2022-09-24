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

get('/word/new') do
  erb(:word_new)
end

post('/words') do
  new_word = params[:word]
  word = Word.new(word: new_word, id: nil)
  word.save()
  redirect to('/')
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end