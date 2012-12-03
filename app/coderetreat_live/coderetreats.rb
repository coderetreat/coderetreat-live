require 'coderetreat_live/coderetreats/presenters/collection'

module CoderetreatLive
  module Coderetreats
    Coderetreat = Struct.new :status, :location
    def self.running_today
      self.for_collection ::Coderetreat.running_today
    end

    def self.for_collection(coderetreats)
      Presenters::Collection.new(coderetreats)
    end
  end
end
