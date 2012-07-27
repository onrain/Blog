module ApplicationHelper
  def set_time(current_time)
    return "" if current_time.nil?
    current_time.strftime('%B %d, %Y  AT %H:%M')
  end
  
  def current_time
    Time.zone = "Kyiv"
    Time.zone.now
  end
end
