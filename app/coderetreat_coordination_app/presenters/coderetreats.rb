module CoderetreatCoordinationApp::Presenters
  class Coderetreats
    def initialize(retreats)
      @all = retreats
    end
    def not_started
      @all.select(&:not_started?)
    end
  end
end
