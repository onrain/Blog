module CommentsHelper
  def set_time(current_time)
    current_time.strftime('%B %d, %Y  AT %H:%M')
  end
  
  def empty_f(fname)
   fname ||=""
  end
end
