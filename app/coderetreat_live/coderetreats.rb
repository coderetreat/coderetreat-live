module CoderetreatLive
  module Coderetreats
    Coderetreat = Struct.new :status, :location
    def self.todays
    coderetreats = Object.new
    def coderetreats.not_started(&block)
      [
        Coderetreat.new("not_started", "Chicago"),
        Coderetreat.new("not_started", "Seattle")
      ].each(&block)
    end
    def coderetreats.in_session(&block)
      [
        Coderetreat.new("in_session", "Berlin")
      ].each(&block)
    end
    coderetreats
    end
  end
end
