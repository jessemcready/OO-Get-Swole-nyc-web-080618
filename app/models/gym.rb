class Gym
  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end # initialize

  def self.all
    @@all
  end # self.all

  def memberships
    Membership.all.select do |membership|
      membership.gym == self
    end # Membership.all.select
  end # memberships

  def lifters
    memberships.map do |membership|
      membership.lifter
    end # memberships.map
  end # lifters

  def lifter_names
    lifters.map do |lifter|
      lifter.name
    end # lifters.map
  end # lifter_name

  def lift_total_for_gym
    total = 0
    lifters.each do |lifter|
      total += lifter.lift_total
    end # lifter.each
    total
  end # lift_total_for_gym

end # class Gym
