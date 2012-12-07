require 'coderetreats'
module CoderetreatLive
  module Coderetreats
    module Sessions
      def self.start_new_session_for(coderetreat_token, session_details)
        coderetreat = Coderetreats.update_status(coderetreat_token, Coderetreats::StateMachine.in_session_status_string)
        coderetreat.start_new_session(session_details)
      end

      def self.update_session_info_for(coderetreat_token, session_id, session_details)
        coderetreat = Coderetreats.for_admin_token(coderetreat_token)
        coderetreat.update_session_info(session_id, session_details)
      end

      def self.remove_session_from(coderetreat_token, session_id)
        coderetreat = Coderetreats.for_admin_token(coderetreat_token)
        coderetreat.remove_session(session_id)
      end

      def self.for_coderetreat(coderetreat_token, session_id)
        coderetreat = Coderetreats.for_admin_token(coderetreat_token)
        [coderetreat.session_by_id(session_id), coderetreat]
      end
    end
  end
end
