module CoderetreatsHelper
  def coderetreat_state_display(coderetreat)
    case coderetreat.state_name
    when :not_started
      "Not Started"
    when :started
      "Just Started"
    when :in_introduction
      "Doing Introduction"
    end
  end

  def coderetreat_next_state(coderetreat)
    case coderetreat.state_name
    when :not_started
      ["Start", :start]
    when :started
      ["Do Introduction", :in_introduction]
    when :in_introduction
      ["Start Session", :start_session]
    end
  end
end
