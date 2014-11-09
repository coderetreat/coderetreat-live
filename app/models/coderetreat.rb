require 'has_tokens'
class Coderetreat < ActiveRecord::Base
  attr_accessible :location, :status, :date

  HasTokens.on self
  has_tokens admin: 10
  before_create :generate_tokens
  before_create :set_default_attribute_values

  has_many :sessions, class_name: "CoderetreatSession", order: "created_at DESC", :dependent => :destroy

  def self.running_today
    self.where("date > ?", 1.week.ago)
  end

  def update_status_to(new_status)
    self.update_attribute :status, new_status
    self
  end

  def session_by_id(session_id)
    sessions.find session_id
  end

  def start_new_session(session_params)
    sessions.create with_constraints(session_params)
  end

  def update_session_info(session_id, session_params)
    sessions.find(session_id).update_attributes session_params
  end

  def remove_session(session_id)
    sessions.destroy session_id
  end

  def in_session?
    CoderetreatLive::Coderetreats::StateMachine.in_session_status?(self.status) && current_session.present?
  end

  def current_session_constraints
    current_session.constraints if current_session
  end

  def current_session
    @current_session ||= self.sessions.first
  end

  def previous_sessions
    @previous_session ||= self.sessions - [self.current_session]
  end

  def set_default_attribute_values
    self.status ||= CoderetreatLive::Coderetreats::StateMachine.default_state_string
  end

  protected

  def with_constraints(session_params)
    if empty_constraints?(session_params)
      session_params["constraints"] = next_session_default_constraint
    end
    session_params
  end

  def empty_constraints?(session_params)
    session_params["constraints"].to_s == ''
  end

  def next_session_default_constraint
    "Session #{sessions.count+1}"
  end
end
