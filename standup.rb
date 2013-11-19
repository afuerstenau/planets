class Standup

  attr_reader :hour
  attr_reader :minute
  attr_reader :days_in_week

  DAYS_IN_WEEK = [ :every_day, :monday, :tuesday, :wednesday, :thursday, :friday]

  def initialize (hour, minute, days_in_week)
    @hour=hour
    @minute=minute
    @days_in_week=days_in_week
  end
end