class Team

  attr_accessor :name, :motto, :members
  TEAM = []
  def initialize(params)
    @name = params[:name]
    @motto = params[:motto]
    @members = params[:members].map do |member|
        Hero.new(member)
    end
    TEAM << self
  end

  def self.all
    TEAM
  end

end
