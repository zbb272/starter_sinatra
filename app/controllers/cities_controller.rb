class CitiesController < ApplicationController

  get "/cities" do
    @cities = City.all
    erb :"/cities/index"
  end

  post "/cities" do
    name = params[:cities][:name]
    population = params[:cities][:population]

    @city = City.create(:name => name, :population => population)

    redirect "/cities"
  end

  get "/cities/new" do
    erb :"/cities/new"
  end

  get "/cities/:id" do
    @city = City.find(params[:id])
    @country = @city.country
    erb :"/cities/show"
  end

  patch "/cities/:id" do
    @city = City.find(params[:id])
    @city.update(:name => params[:cities][:name], :population => params[:cities][:population])
    redirect "/cities/#{params[:id]}"
  end

  delete "/cities/:id" do
    @city = City.find(params[:id])
    @city.destroy
    redirect "/cities"
  end

  get "/cities/:id/edit" do
    @city = City.find(params[:id])
    erb :"/cities/edit"
  end

end
