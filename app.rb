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

post('/word/:id/def') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(definition: params[:definition_text], id: nil, word_id: @word.id)
  definition.save()
  erb(:word)
end

get('/word/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:word_edit)
end

patch('/word/:id') do
  @word = Word.find(params[:id].to_i)
  @word.update(params[:word_edit])
  redirect to("/word/#{@word.id}")
end

delete('/word/:id') do
  word = Word.find(params[:id].to_i)
  word.delete
  redirect '/'
end
