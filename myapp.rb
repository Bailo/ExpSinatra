require 'sinatra'


get '/' do
  erb :home
end


get '/memory' do
  memory = `vm_stat`[/Pages active:\W+(\d+)./]
  erb :memory, layout: :return, locals: { memory: memory }
end

get '/disk' do
  disk = `df -H | head -n 2`
  erb :disk, layout: :return, locals: { disk: disk }
end