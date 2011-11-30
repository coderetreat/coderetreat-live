module CoderetreatLive
  module CoderetreatStates
    def self.included(klass, *_)
      klass.state_machine :state, initial: :not_started do
        event :not_started do
          transition all => :not_started
        end
        event :start do
          transition all => :started
        end
        event :do_introduction do
          transition all => :in_introduction
        end
        event :start_session do
          transition all => :in_session
        end
        event :finish_session do
          transition :in_session => :on_break
        end

        before_transition any => :in_session, :do => :increment_session_number
      end
    end

    def increment_session_number
      self.session_number = self.session_number.to_i + 1
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
