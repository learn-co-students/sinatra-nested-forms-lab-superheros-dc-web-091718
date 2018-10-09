require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team])      
      @heroes = params[:team][:heroes].map do |hero_params|
        Hero.new(hero_params)
      end

      erb :team
    end
end
