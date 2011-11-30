module CoderetreatLive
  module Presenters
    class Coderetreats
      def initialize(retreats)
        @all = retreats
      end

      def not_started
        @all.select(&:not_started?)
      end

      def just_started
        @all.select(&:just_started?)
      end

      def in_introduction
        @all.select(&:in_introduction?)
      end

      def in_session
        @all.select(&:in_session?)
      end

      def on_break
        @all.select(&:on_break?)
      end
    end
  end
end
