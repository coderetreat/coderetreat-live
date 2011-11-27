module CoderetreatLive::Presenters
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
  end
end
