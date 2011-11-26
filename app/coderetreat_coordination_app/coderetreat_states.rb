module CoderetreatCoordinationApp
  module CoderetreatStates
    def self.included(klass, *args)
      klass.state_machine :state, initial: :not_started do
        event :start do
          transition not_started: :started
        end
      end
    end
  end
end
