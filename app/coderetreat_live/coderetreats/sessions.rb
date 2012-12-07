require 'coderetreats'
module CoderetreatLive
  module Coderetreats
    module Sessions
      def self.start_new_session_for(coderetreat_token, session_details)
        coderetreat = Coderetreats.update_status(coderetreat_token, Coderetreats::StateMachine.in_session_status_string)
        coderetreat.start_new_session(session_details)
      end

      def self.remove_session_from(coderetreat_token, session_id)
        coderetreat = Coderetreats.for_admin_token(coderetreat_token)
        coderetreat.remove_session(session_id)
      end
    end
  end
end
