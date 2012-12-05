module Admin::CoderetreatHelper
  def human_view_coderetreat_status(coderetreat)
    coderetreat.status.humanize
  end
end
