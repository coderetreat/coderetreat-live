require 'has_tokens'
class Coderetreat < ActiveRecord::Base
  attr_accessible :location, :status, :date

  HasTokens.on self
  has_tokens admin: 10
  before_create :generate_tokens
  before_create :set_default_attribute_values

  def self.running_today
    self.where(:date => DateTime.now.to_date)
  end

  def update_status_to(new_status)
    self.update_attribute :status, new_status
  end

  def set_default_attribute_values
    self.status ||= CoderetreatLive::Coderetreats::StateMachine.default_state_string
  end
end
