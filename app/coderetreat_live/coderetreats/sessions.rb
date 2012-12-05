require 'coderetreats'
module CoderetreatLive
  module Coderetreats
    module Sessions
      def self.start_new_session_for(coderetreat_token, session_details)
        coderetreat = Coderetreats.update_status(coderetreat_token, "in_session")
      end
    end
  end
end
