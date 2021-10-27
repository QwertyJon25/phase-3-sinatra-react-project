class DogController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/dogs" do
    dog = Dog.all 
    dog.to_json
  end

  get "/dogs/agencies" do
    agency = Dog.all 
    agency.to_json(include: :agency)
  end

   get '/dogs/:id' do
    dog = Dog.find(params[:id])
    dog.to_json
  end

  delete '/dogs/:id' do
  dog = Dog.find(params[:id])
  dog.destroy
  dog.to_json
end

post '/dogs' do
  dog = Dog.create(
    name: params[:name],
    breed: params[:breed],
    age: params[:age],
    img_url: params[:img_url],
    agency_id: params[:agency_id]
  )
  dog.to_json
end

patch '/dogs/:id' do
  dog = Dog.find(params[:id])
  dog.update(
    name: params[:name],
    breed: params[:breed],
    age: params[:age],
    img_url: params[:img_url],
    agency_id: params[:agency_id]
  )
  dog.to_json
end

end