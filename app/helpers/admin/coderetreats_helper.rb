module Admin
  module CoderetreatsHelper
    def human_view_coderetreat_status(status)
      status.to_s.humanize
    end
  end
end
