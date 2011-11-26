module CoderetreatCoordinationApp
  module CoderetreatStates
    def self.included(klass, *args)
      klass.state_machine :state, initial: :not_started
    end
  end
end
