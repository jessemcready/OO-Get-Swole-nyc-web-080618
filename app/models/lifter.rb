class Lifter
  @@all = []

  attr_accessor :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end # initialize

  def self.all
    @@all
  end # self.all

  def memberships
    Membership.all.select do |membership|
      membership.lifter == self
    end # Membership.all.select
  end # memberships

  def gyms
    memberships.map do |membership|
      membership.gym
    end # memberships.map
  end # gyms

  def self.average_lift
    avg_lift = 0
    total = 0
    @@all.each do |lifter|
      total += lifter.lift_total
    end # all.each
    avg_lift = total / @@all.length
  end # self.average_lift

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end # sign_up

  def total_cost
    sum = 0
    memberships.each do |membership|
      sum += membership.cost
    end # memberships.each
    sum
  end # total_cost

end
