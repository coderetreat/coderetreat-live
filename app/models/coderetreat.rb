require 'coderetreat_states'
require 'presenters/coderetreats'
require 'token'
class Coderetreat < ActiveRecord::Base
  include CoderetreatLive::CoderetreatStates

  has_many :sessions

  before_create :generate_token

  def self.for_admin(token)
    find_by_admin_token!(token)
  end

  def self.for_today
    where(scheduled_for: Date.today)
  end

  def self.todays
    CoderetreatLive::Presenters::Coderetreats.new self.for_today
  end

private
  def generate_token
    self.admin_token = CoderetreatLive::Token.new.to_s
  end

end
