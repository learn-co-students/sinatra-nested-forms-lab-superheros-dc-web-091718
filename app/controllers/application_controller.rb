require 'sinatra/base'
require_all 'config'
# require '../config/environment.rb'
class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }


    get "/" do
      erb :super_hero
    end

    post "/teams" do
      @team = Team.new(params["team"])
      @heros=[]
      params["team"]["members"].each do |details|
        @heros << Hero.new(details)
      end
      erb :team
    end

end
class Hero
  attr_accessor :name, :power, :bio

  @@all = []

  def initialize(args)
    @name = args["name"]
    @power= args["power"]
    @bio= args["bio"]
    @@all << self
  end

  def self.all
    @@all
  end

end

class Team
  attr_accessor :name, :motto

  @@all = []

  def initialize(args)
    @name = args["name"]
    @motto = args["motto"]
    @@all << self
  end

  def self.all
    @@all
  end

end
