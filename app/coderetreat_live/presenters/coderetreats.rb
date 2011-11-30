module CoderetreatLive
  module Presenters
    class Coderetreats
      def initialize(retreats)
        @all = retreats
      end

      [:not_started, :just_started, :in_introduction,
        :in_session, :on_break, :in_closing_circle,
        :finished].each do |state|
        define_method state do
          @all.select(&"#{state}?".to_sym)
        end
      end
    end
  end
end
