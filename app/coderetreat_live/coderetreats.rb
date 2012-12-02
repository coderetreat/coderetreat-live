module CoderetreatLive
  module Coderetreats
    Coderetreat = Struct.new :status, :location
    def self.running_today
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

    Collection = Struct.new(:coderetreats) do
      def empty?
        self.coderetreats.empty?
      end
      def not_started
        self.coderetreats.select{|coderetreat| coderetreat.status == "not_started"}
      end
    end
    def self.for_collection(coderetreats)
      Collection.new(coderetreats)
    end
  end
end
