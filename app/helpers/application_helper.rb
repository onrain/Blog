module ApplicationHelper
  def current_time
    Time.zone = "Kyiv"
    Time.zone.now
  end
end
