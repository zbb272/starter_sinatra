class CountriesController < ApplicationController

  get "/countries" do
    @cities = City.all
    @countries = Country.all
    erb :"/countries/index"
  end

  post "/countries" do
    @name = params[:country][:name]
    @country = Country.create(:name => @name)
    if !params[:country][:city_ids].nil?
      params[:country][:city_ids].each do | city_id |
        @country.cities << City.find(city_id)
      end
    end

    @country.cities << City.create(:name => params[:city][:name], :population => params[:city][:population])

    redirect "/countries"
  end

  get "/countries/new" do
    @cities = City.all
    erb :"/countries/new"
  end

  get "/countries/:id" do
    @country = Country.find(params[:id])
    @cities = @country.cities
    erb :"/countries/show"
  end

  patch "/countries/:id" do
    @name = params[:country][:name]
    @cities = []

    params[:country][:city_ids].each do | id |
      @cities << City.find(id.to_i)
    end

    @country = Country.update(:name => @name, :cities => @cities)

    redirect "/countries/#{params[:id]}"
  end

  delete "/countries/:id" do
    @country = Country.find(params[:id])
    @country.destroy
    redirect "/countries"
  end

  get "/countries/:id/edit" do
    @country = Country.find(params[:id])
    @cities = City.all
    erb :"/countries/edit"
  end
end
