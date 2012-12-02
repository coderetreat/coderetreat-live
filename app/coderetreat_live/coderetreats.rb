module CoderetreatLive
  module Coderetreats
    Coderetreat = Struct.new :status, :location
    def self.running_today
      self.for_collection ::Coderetreat.running_today
    end

    def self.for_collection(coderetreats)
      Presenters::Collection.new(coderetreats)
    end

    module Presenters
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
end
