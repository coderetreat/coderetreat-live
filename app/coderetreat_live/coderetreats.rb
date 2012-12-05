require 'coderetreats/presenters/collection'

module CoderetreatLive
  module Coderetreats
    def self.running_today
      self.for_collection ::Coderetreat.running_today
    end

    def self.for_collection(coderetreats)
      Presenters::Collection.new(coderetreats)
    end

    def self.for_admin_token(token)
      ::Coderetreat.for_admin(token)
    end

    def self.update_status(token, new_status)
      for_admin_token(token).update_status_to new_status
    end
  end
end
