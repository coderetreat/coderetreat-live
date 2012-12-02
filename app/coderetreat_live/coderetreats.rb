module CoderetreatLive
  module Coderetreats
    Coderetreat = Struct.new :status, :location
    def self.running_today
      self.for_collection [
        Coderetreat.new("not_started", "Chicago"),
        Coderetreat.new("not_started", "Seattle"),
        Coderetreat.new("in_session", "Berlin")
      ]
    end

    def self.for_collection(coderetreats)
      Collection.new(coderetreats)
    end
    Collection = Struct.new(:coderetreats) do
      def empty?
        self.coderetreats.empty?
      end

      [:not_started,
        :in_session].each do |status|
        define_method status do |&block|
          self.by_status status, &block
        end
      end

      def by_status(status, &block)
        self.coderetreats.select{|coderetreat| coderetreat.status.to_sym == status.to_sym}.each(&block)
      end
    end
  end
end
