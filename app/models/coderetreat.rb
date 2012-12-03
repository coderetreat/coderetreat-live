class Coderetreat < ActiveRecord::Base
  attr_accessible :location, :status, :date

  HasTokens.on self
  has_tokens admin: 10
  before_create :generate_tokens

  def self.running_today
    self.where(:date => DateTime.now.to_date)
  end
end
