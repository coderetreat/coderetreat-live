module CoderetreatCoordinationApp
  module CoderetreatStates
    def self.included(klass, *args)
      klass.state_machine :state, initial: :not_started do
        event :not_started do
          transition :started => :not_started
        end
        event :start do
          transition :not_started => :started
        end
        event :do_introduction do
          transition :started => :in_introduction
        end
      end
    end

    def just_started?
      started?
    end

    def change_state(new_state)
      case new_state.downcase
      when "start"
        start!
      when "in_introduction"
        do_introduction!
      end
    end
  end
end
