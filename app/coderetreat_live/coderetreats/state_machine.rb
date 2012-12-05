module CoderetreatLive
  module Coderetreats
    module StateMachine
      STATES = [:not_started, :in_session, :finished]

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
