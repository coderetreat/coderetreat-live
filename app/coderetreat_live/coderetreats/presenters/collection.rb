require 'coderetreats/state_machine'
module CoderetreatLive
  module Coderetreats
    module Presenters
      class Collection
        attr_accessor :coderetreats

        def initialize(coderetreats)
          @coderetreats = coderetreats
        end

        def empty?
          self.coderetreats.empty?
        end

        CoderetreatLive::Coderetreats::StateMachine::STATES.each do |status|
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
