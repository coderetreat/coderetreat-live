module CoderetreatLive
  module Coderetreats
    module StateMachine
      STATES = [:not_started, :in_session, :finished]

      def self.default_state_string
        "not_started"
      end
    end
  end
end
