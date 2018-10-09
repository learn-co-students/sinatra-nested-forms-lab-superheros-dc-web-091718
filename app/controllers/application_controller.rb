require 'sinatra/base'

class App < Sinatra::Base

	set :views, Proc.new { File.join(root, "../views/") }

	get '/' do
		erb :super_hero
	end

	post '/teams' do

		@team_info = TeamInfo.new(params["team[name]"], params["team[motto]"])

		@heroes = []
		@heroes << Superhero.new(params["member1_name"], params["member1_power"], params["member1_bio"])
		@heroes << Superhero.new(params["member2_name"], params["member2_power"], params["member2_bio"])
		@heroes << Superhero.new(params["member3_name"], params["member3_power"], params["member3_bio"])

		erb :team
	end

end
