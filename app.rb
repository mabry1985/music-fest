require('sinatra')
require('sinatra/reloader')
require('./lib/artist')
require('./lib/stage')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @stages = Stage.all
  erb(:index)
end

post('/') do
  name = params[:name]
  location = params[:location]
  genre = params[:genre]
  stage = Stage.new({:name => name, :id => Stage.all.length, :location => location, :genre => genre})
  stage.save()
  @stages = Stage.all
  erb(:index)
end

get ('/stages/new') do
  erb(:new_stage)
end

get ('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  erb(:stage)
end

get('/stages/:id/edit') do
  @stage = Stage.find(params[:id].to_i())
  erb(:stage_update)
end

patch('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @stage.update(params[:name], params[:location], params[:genre])
  erb(:stage)
end

delete('/') do
  @stages = Stage.all
  erb(:index)
end
