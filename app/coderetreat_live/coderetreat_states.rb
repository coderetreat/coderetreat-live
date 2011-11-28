module CoderetreatLive
  module CoderetreatStates
    def self.included(klass, *_)
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

    StateInformation = Struct.new :current_state, :current_state_display,
                                  :next_state, :next_state_display
    def state_information
      info = StateInformation.new self.state_name, self.human_state_name
      info.next_state_display, info.next_state = case self.state_name
      when :not_started
        ["Start", :start]
      when :started
        ["Do Introduction", :in_introduction]
      when :in_introduction
        ["Start Session", :start_session]
      end
      info
    end
  end
end
