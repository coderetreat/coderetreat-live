require 'coderetreat_states'
require 'presenters/coderetreats'
class Coderetreat < ActiveRecord::Base
  include CoderetreatCoordinationApp::CoderetreatStates

  def self.for_today
    where(scheduled_for: Date.today)
  end

  def self.todays
    CoderetreatCoordinationApp::Presenters::Coderetreats.new self.for_today
  end
end
