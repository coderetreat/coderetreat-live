module CoderetreatCucumberHelpers
  module Entities
    def coderetreats
      @coderetreats ||= []
    end

    def coderetreat
      coderetreats.first
    end
  end
end
World(CoderetreatCucumberHelpers::Entities)

module CoderetreatCucumberHelpers
  module Selectors
    def coderetreat_selector(event = coderetreat)
      "#coderetreat_#{event.id}"
    end
  end
end
World(CoderetreatCucumberHelpers::Selectors)

