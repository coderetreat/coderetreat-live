module CoderetreatLive
  module Coderetreats
    module StateMachine
      STATES = [:not_started, :in_session, :at_lunch, :on_break, :finished]
      IN_SESSION_STATE = :in_session
      NOT_RUNNING_STATES = [:not_started, :finished]
      RUNNING_STATES = STATES - NOT_RUNNING_STATES
      RUNNING_NON_SESSION_STATES = RUNNING_STATES - [IN_SESSION_STATE]

      def self.default_state_string
        "not_started"
      end

      def self.in_session_status
        :in_session
      end

      def self.in_session_status?(status)
        status.to_s == self.in_session_status.to_s
      end
    end
  end
end
