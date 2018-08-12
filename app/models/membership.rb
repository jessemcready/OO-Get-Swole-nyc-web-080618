class Membership
  attr_reader :cost, :lifter, :gym

  @@all = []

  def initialize(lifter, gym, cost)
    @cost = cost
    @lifter = lifter
    @gym = gym
    @@all << self
  end # initialize

  def self.all
    @@all
  end # self.all

end
