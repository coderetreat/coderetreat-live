class Coderetreat < ActiveRecord::Base
  attr_accessible :location, :status, :date

  def self.running_today
    self.where(:date => DateTime.now.to_date)
  end
end
