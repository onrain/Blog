module ApplicationHelper
  def set_time(current_time)
    current_time.strftime('%B %d, %Y  AT %H:%M')
    current_time ||=""
  end
  
  def current_time
    Time.zone = "Kyiv"
    Time.zone.now
  end
end
