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

      [:not_started,
        :in_session].each do |status|
        define_method status do
          self.by_status status
        end
      end

      def by_status(status)
        self.coderetreats.select{|coderetreat| coderetreat.status.to_sym == status.to_sym}
      end
    end
    def self.for_collection(coderetreats)
      Collection.new(coderetreats)
    end
  end
end
